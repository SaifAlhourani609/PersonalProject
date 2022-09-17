import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import '../home.dart';
import '../string/app_colors.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audio/welcome.mp3";
  bool isplaying = true;
  bool audioplayed = true;
  late Uint8List audiobytes;
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
      audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      int result = await player.playBytes(audiobytes);
      Timer(const Duration(seconds: 5), () async {
        int result = await player.stop();
        if(result == 1){ //stop success
          setState(() {
            isplaying = false;
            audioplayed = false;
            currentpos = 0;
          });
        }
      });
    });
    _navigatetohome();
    super.initState();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 6000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child:  Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.81,
                width: MediaQuery.of(context).size.width,
              ),
              const SafeArea(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.red,
                  strokeWidth: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
