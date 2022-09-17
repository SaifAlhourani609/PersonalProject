import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:wealth_earn/auth/login_screen.dart';
import 'package:wealth_earn/config/prefs/pref_utils.dart';
import 'package:wealth_earn/string/app_variable.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';
import '../../model/user_data_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

TextEditingController fullNameController = TextEditingController();

final AppVariables _appVariables = Get.put(AppVariables());

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _invitationCode = TextEditingController();

  String _emailErrorMsg = '';
  String _passErrorMsg = '';
  String _confirmpasswordMsg  = '';
  String _invitationCodeMsg  = '';
  final String _fullNameErrorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        top: 175, bottom: 50, left: 200, right: 210)),
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
                    height: MediaQuery.of(context).size.height/1.5,
                    child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                              children: [
                                const SizedBox(
                                    height: 40,
                                    child: Text(
                                      'Signup',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    )),
                                TextFormField(
                                  controller: fullNameController,
                                  decoration: InputDecoration(
                                      errorText: _fullNameErrorMsg,
                                      border: const OutlineInputBorder(
                                          borderSide:  BorderSide(
                                              style: BorderStyle.solid,
                                              width: 5,
                                              color: Colors.blue),
                                          borderRadius:  BorderRadius.all(
                                               Radius.circular(20))),
                                      labelText: 'username',
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.blue),
                                      prefixIcon: const Icon(Icons.person),
                                      hintText: 'Enter user name'),
                                  textInputAction: TextInputAction.next,

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Valid User Name';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      errorText: _emailErrorMsg,
                                      border: const OutlineInputBorder(
                                          borderSide:  BorderSide(
                                              style: BorderStyle.solid,
                                              width: 5,
                                              color: Colors.blue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      labelText: 'E-mail Address',
                                      labelStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                      hintText: 'Please Enter Your E-mail',
                                      prefixIcon: const Icon(Icons.email)),
                                  enableSuggestions: true,
                                  autocorrect: true,
                                  inputFormatters: const [
                                    // FilteringTextInputFormatter.allow(
                                    //     RegExp(r'[0-9a-zA-Z ]+'))
                                  ],
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Your E-mail';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                      errorText: _passErrorMsg,
                                      border: const OutlineInputBorder(
                                          borderSide:  BorderSide(
                                              style: BorderStyle.solid,
                                              width: 5,
                                              color: Colors.blue),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      labelText: 'Password',
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.blue),
                                      prefixIcon: const Icon(Icons.verified_user),
                                      hintText: 'Enter your password'),
                                  obscureText: true,
                                  keyboardType: TextInputType.multiline,
                                  autocorrect: true,
                                  enableSuggestions: true,
                                  textInputAction: TextInputAction.next,
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return 'Please Enter Valid Password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password Must be more than 6 digits';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _confirmpasswordController,
                                  decoration: InputDecoration(
                                      errorText: _confirmpasswordMsg,
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
                                          color: Colors.blue),
                                      prefixIcon: const Icon(Icons.verified_user),
                                      hintText: 'Enter your password'),
                                  obscureText: true,
                                  keyboardType: TextInputType.multiline,
                                  autocorrect: true,
                                  enableSuggestions: true,
                                  textInputAction: TextInputAction.next,
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return 'Please Enter Valid Password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password Must be more than 6 digits';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _invitationCode,
                                  decoration: InputDecoration(
                                      errorText: _invitationCodeMsg,
                                      border: const OutlineInputBorder(
                                          borderSide:  BorderSide(
                                              style: BorderStyle.solid,
                                              width: 5,
                                              color: Colors.blue),
                                          borderRadius:  BorderRadius.all(
                                               Radius.circular(20))),
                                      labelText: 'Invitation code',
                                      labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.blue),
                                      prefixIcon: const Icon(Icons.code),
                                      hintText: 'Enter your invitation code'),
                                  obscureText: true,
                                  keyboardType: TextInputType.multiline,
                                  autocorrect: true,
                                  enableSuggestions: true,
                                  textInputAction: TextInputAction.done,
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return 'Please Enter Valid invitation code';
                                    }
                                    if (value.length < 6) {
                                      return 'code Must be more than 6 digits';
                                    }
                                    if (value.length > 8) {
                                      return 'code Must be less than 8 digits';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
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
                                          var result = await auth.createUserWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          );
                                          if(result.user!= null){
                                            MyUser user=MyUser(email: _emailController.text, password: _passwordController.text);
                                            if(fullNameController.text.isNotEmpty)
                                              user.name=fullNameController.text;
                                            var collection = FirebaseFirestore.instance.collection('users');
                                            collection.add(user.toJson());
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => Wallet()));
                                            _appVariables.emailGetX.value = _emailController.text;
                                            PrefUtils.setIsLoggedIn(true);
                                            PrefUtils.getEmail(email: _appVariables.emailGetX.value);
                                            _appVariables.pendingGetX.value = "0";
                                            _appVariables.orderGetX.value = "15";
                                            PrefUtils.getPending(
                                                pending: _appVariables.pendingGetX.value
                                            );
                                            PrefUtils.getOrders(
                                                order: _appVariables.orderGetX.value
                                            );
                                          }
                                        } catch (e) {
                                          print(e);
                                          showPopup(e.toString().replaceAll('[firebase_auth/email-already-in-use]', ''));
                                        }
                                      }
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 60, right: 60, top: 8, bottom: 8),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const SizedBox(
                                  child: Center(
                                    child: Text('Sign Up For New Account'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),   SizedBox(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const Login()));
                                        },
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [  Text(
                                          'I Already Have An Account.',
                                          style: TextStyle(color: Colors.black54),
                                        ),  Text(
                                          'Login?',
                                          style: TextStyle(color: Colors.blue),
                                        )])
                                      ))
                              ]),
                        )))
              ],
            ),
          ))
        ]),
      ),
    );
  }

  bool _isValid() {
    setState(() {
      _passErrorMsg = '';
      _emailErrorMsg = '';
      _confirmpasswordMsg = '';
      _invitationCodeMsg = '';
    });
    if (_emailController.text.isEmpty) {
      setState(() {
        _emailErrorMsg = 'Email is required';
      });
      return false;
    }
    if (!_emailController.text.isEmail()) {
      setState(() {
        _emailErrorMsg = 'Email is badly format';
      });
      return false;
    }
    if (_passwordController.text.isEmpty) {
      setState(() {
        _passErrorMsg = 'Password is required';
      });
      return false;
    }
    if (_confirmpasswordController.text != _passwordController.text) {
      setState(() {
        _confirmpasswordMsg = 'must be equal';
      });
      return false;
    }
    if (_passwordController.text.length < 6) {
      setState(() {
        _passErrorMsg = 'Password must be 6 or more';
      });
      return false;
    }
    if (_confirmpasswordController.text.length < 6) {
      setState(() {
        _confirmpasswordMsg = 'Password must be 6 or more';
      });
      return false;
    }

    if (_invitationCode.text != '546213') {
      setState(() {
        _confirmpasswordMsg = 'invalid code!';
      });
      return false;
    }

    setState(() {
      _passErrorMsg = '';
      _emailErrorMsg = '';
      _confirmpasswordMsg = '';
      _invitationCodeMsg = '';
    });
    return true;
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
