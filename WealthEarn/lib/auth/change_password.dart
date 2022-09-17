import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wealth_earn/screens/account_screen.dart';
import 'package:wealth_earn/string/app_variable.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _oldEmailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  final AppVariables _appVariables = Get.put(AppVariables());

  final auth = FirebaseAuth.instance; // create new instance from auth
  var collection = FirebaseFirestore.instance.collection('users');

  String _emailErrorMsg = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1a1830),
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => SettingsPage(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 200),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),color: Color(0xff1a1830),
        ),
      ),
      body: Container(color: Color(0xff1a1830),
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.change_circle,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Change Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Enter Your E-mail authentication",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
            ),const SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: _oldEmailController,
              decoration: InputDecoration(
                  errorText: _emailErrorMsg.toString(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Your E-mail',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter your current E-mail'),style:TextStyle(color:Colors.white, ) ,
              keyboardType: TextInputType.emailAddress,
              autocorrect: true,
              enableSuggestions: true,
              textInputAction: TextInputAction.done,
              validator: (value) {
                // if (_oldEmailController.text == _appVariables.emailGetX.value) {
                //   return 'Please Enter a Valid E-mail Address';
                // }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff6BB49F),
                    side: const BorderSide(style: BorderStyle.solid, width: 2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                onPressed: () async {
                  if (_isValid()) {
                    try {
                      final auth = FirebaseAuth
                          .instance; // create new instance from auth
                      var sendPasswordResetEmail =
                          await auth.sendPasswordResetEmail(
                              email: _oldEmailController.text.trim());
                    } catch (e) {
                      print(e);
                    }
                    var snackBar;
                    snackBar = SnackBar(
                        content: Text('Check your email to reset password..'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 60, right: 60, top: 8, bottom: 8),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // checkEmail() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   _appVariables.emailGetX.value = preferences.getString("email")!;
  // }

  bool _isValid() {
    if (_oldEmailController.text.isEmpty) {
      setState(() {
        _emailErrorMsg = 'Email is required';
      });
      return false;
    }
    if (!_oldEmailController.text.contains("@")) {
      setState(() {
        _emailErrorMsg = 'Email should be have @';
      });
      return false;
    }
    return true;
  }
}
