import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wealth_earn/authentication/splash_screen.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    GetMaterialApp(
      home: SplashView(),
      title: 'Hello',
      debugShowCheckedModeBanner: false,
    );
  }
}
