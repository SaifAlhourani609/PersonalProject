import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:inquiregame/prefs/pref_utils.dart';
import 'package:inquiregame/questions/questions.dart';
import 'package:inquiregame/widgets/card_question_widgets.dart';

import 'questions/question_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audio/inside_q.mp3";
  bool isplaying = true;
  bool audioplayed = true;
  late Uint8List audiobytes;
  AudioPlayer player = AudioPlayer();

  final scrollDirection = Axis.vertical;
  late AutoScrollController controller;

  Future _scrollToIndex() async {
    await controller.scrollToIndex(10,
        preferPosition: AutoScrollPosition.begin);
  }

  @override
  void initState() {
    // audio.
    Future.delayed(const Duration(seconds: 0), () async {
      ByteData bytes =
          await rootBundle.load(audioasset); //load audio from assets
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      int result = await player.playBytes(audiobytes);
    });

    // auto scroll view.
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);

    super.initState();
  }

  _pauseAudio() async {
    int result = await player.pause();
    PrefUtils.caseAudio(isplaying = false, audioplayed = false, result);
  }

  _resumeAudio() async {
    int result = await player.resume();
    PrefUtils.caseAudio(isplaying = true, audioplayed = true, result);
  }

  // to change Icon audio in 'appbar'.
  Icon fab = const Icon(
    Icons.volume_up,
  );
  bool _isDisabled = true;
  bool pressed = false;
  int fabIconNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: fab,
              onPressed: () {
                isplaying ? _pauseAudio() : _resumeAudio();
                _scrollToIndex;
                setState(() {
                  if (fabIconNumber == 0) {
                    fab = const Icon(
                      Icons.volume_off,
                    );
                    _isDisabled = false;
                    fabIconNumber++;
                    pressed = true;
                  } else {
                    fab = const Icon(Icons.volume_up);
                    fabIconNumber--;
                    _isDisabled = true;
                    pressed = false;
                  }
                });
              },
            ),
            IconButton(
                icon: const Icon(
                  Icons.switch_camera_rounded,
                ),
                onPressed: _scrollToIndex),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background_splash.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            scrollDirection: scrollDirection,
            controller: controller,
            children: <Widget>[
              ...List.generate(20, (index) {
                return AutoScrollTag(
                    key: ValueKey(index),
                    controller: controller,
                    index: index,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 185,
                          width: 185,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const questions_view()))
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor: Colors.green,
                              color: Colors.green,
                              margin: const EdgeInsets.all(20),
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/logo.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 185,
                          width: 185,
                          child: Card(
                            elevation: 8,
                            shadowColor: Colors.green,
                            color: Colors.green,
                            margin: const EdgeInsets.all(20),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/logo.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
              }),
            ],
          ),
          // ListView.builder(
          //     scrollDirection: scrollDirection,
          //     itemCount: 19,
          //     itemBuilder: (BuildContext context, int index) {
          //       return SizedBox(
          //         width: MediaQuery.of(context).size.width,
          //         height: MediaQuery.of(context).size.height * 0.14,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             SizedBox(
          //               width: MediaQuery.of(context).size.width*0.3,
          //               height: 100,
          //               child: Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(15.0),
          //                 ),
          //                 color: Colors.lightBlueAccent.withOpacity(0.5),
          //               ),
          //             ),
          //             SizedBox(
          //               width: MediaQuery.of(context).size.width*0.3,
          //               height: 100,
          //               child: Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(15.0),
          //                 ),
          //                 color: Colors.lightBlueAccent.withOpacity(0.5),
          //               ),
          //             ),
          //             SizedBox(
          //               width: MediaQuery.of(context).size.width*0.3,
          //               height: 100,
          //               child: Card(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(15.0),
          //                 ),
          //                 color: Colors.lightBlueAccent.withOpacity(0.5),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     }),
        ));
  }
}
