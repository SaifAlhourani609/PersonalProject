import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wealth_earn/authentication/welcome_screen.dart';
import 'package:wealth_earn/config/prefs/pref_utils.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () async {
        bool isLoggedIn = await PrefUtils.getIsLoggedIn();
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Wallet()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        /// if you want to add image to background screen
        // decoration: new BoxDecoration(
        //   image: new DecorationImage(
        //     image: new AssetImage("assets/images/app/background.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/welcome_screen/appLogo.png',
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              // width: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
