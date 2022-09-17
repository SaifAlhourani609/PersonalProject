import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wealth_earn/config/prefs/pref_utils.dart';
import 'package:wealth_earn/firebase/firebase_error_messages.dart';
import 'package:wealth_earn/model/user_data_model.dart';
import 'package:wealth_earn/auth/signup_screen.dart';
import 'package:wealth_earn/string/app_variable.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
final AppVariables _appVariables = Get.put(AppVariables());

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String _emailErrorMsg = '';
  String _passErrorMsg = '';
  bool _ShowPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffEDD79C),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ClipPath(
              clipper: ClippingClass(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 320.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://ps.w.org/custom-login-page-templates/assets/icon-256x256.png?rev=1667452"))),
              ),
            ),
          ),
          SizedBox(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.only(
                        top: 250, bottom: 50, left: 200, right: 210)),
                Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: const Color(0xffCEE4B5),
                            width: 5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        color: const Color(0xffCEE4B5)),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height / 1.8,
                    child: SingleChildScrollView(
                        child: Form(
                            key: _formKey,
                            child: Column(children: [
                              SizedBox(
                                  height: 75,
                                  child: Column(
                                    children: const [
                                      Text(
                                        'Keep Connected',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'Enter your email address and password to get access your account.')
                                    ],
                                  )),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    prefixIcon: Icon(Icons.person),
                                    hintText: 'Enter your E-mail'),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: true,
                                enableSuggestions: true,
                                textInputAction: TextInputAction.next,
                                // ignore: missing_return
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Please Enter a Valid E-mail Address';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _ShowPass,
                                decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: _changShowPassword,
                                      child: const Icon(Icons.remove_red_eye,
                                          color: Colors.grey, size: 25),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 5,
                                            color: Colors.blue),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    prefixIcon: const Icon(Icons.verified_user),
                                    hintText: 'Enter you password'),

                                keyboardType: TextInputType.multiline,
                                autocorrect: true,
                                enableSuggestions: true,
                                textInputAction: TextInputAction.done,
                                // ignore: missing_return
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Please Enter a Valid Password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password Must be more than 6 digits';
                                  }
                                  return null;
                                },
                              ),
                              const Divider(
                                height: 22,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff6BB49F),
                                      side: const BorderSide(
                                          style: BorderStyle.solid, width: 2),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  onPressed: () async {
                                    if (_isValid()) {
                                      try {
                                        final auth = FirebaseAuth
                                            .instance; // create new instance from auth
                                        var result = await auth
                                            .signInWithEmailAndPassword(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text);
                                        if (result.user != null) {
                                          var collection = FirebaseFirestore
                                              .instance
                                              .collection('users');
                                          var result = await collection
                                              .where('email',
                                                  isEqualTo:
                                                      _emailController.text)
                                              .get();
                                          if (result != null &&
                                              result.docs.isNotEmpty) {
                                            MyUser user = MyUser.fromJson(
                                                result.docs.first.data());
                                            if (user != null) {
                                              print(user.name);
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Wallet()));
                                              _appVariables.emailGetX.value =
                                                  _emailController.text;
                                              PrefUtils.setIsLoggedIn(true);
                                              PrefUtils.getEmail(
                                                  email: _appVariables
                                                      .emailGetX.value);
                                            } else {
                                              print('error');
                                            }
                                          } else {
                                            print(
                                                'Please register or call support');
                                          }
                                        }
                                      } catch (e) {
                                        // print(e);
                                        if (e is FirebaseException) {
                                          showPopup(FirebaseErrors.getMessage(
                                              e.message!));
                                        } else {
                                          print(e);
                                          showPopup(
                                              'Something went wrong please contact with the support');
                                        }
                                      }
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 60, right: 60, top: 8, bottom: 8),
                                    child: Text(
                                      'Log in',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )),
                              SizedBox(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUp()));
                                      },
                                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [  Text(
                                            'I Don\'t Have An Account.',
                                            style: TextStyle(color: Colors.black54),
                                          ),  Text(
                                            'Sign Up?',
                                            style: TextStyle(color: Colors.blue),
                                          )])))
                            ]))))
              ],
            ),
          ))
        ]),
      ),
    );
  }

  void showPopup(String msg) {
    AlertDialog alert = AlertDialog(
      title: const Text('Warning'),
      content: Text(
        msg,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  bool _isValid() {
    setState(() {
      _passErrorMsg = '';
      _emailErrorMsg = '';
    });
    if (_emailController.text.isEmpty) {
      setState(() {
        _emailErrorMsg = 'Email is required';
      });
      return false;
    }
    if (_passwordController.text.isEmpty) {
      setState(() {
        _passErrorMsg = 'Password is required';
      });
      return false;
    }
    setState(() {
      _passErrorMsg = '';
      _emailErrorMsg = '';
    });
    return true;
  }

  void _changShowPassword() {
    setState(() {
      _ShowPass = !_ShowPass;
    });
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
