import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../questions/questions.dart';
import '../string/app_size.dart';
import '../string/app_variable.dart';

class card_question_widgets extends StatefulWidget {
  final int ranking;
  final String question;
  final String firstBranch;
  final String secondBranch;
  final String thirdBranch;
  final String fourthBranch;
  final int sol;
  final Color colorButtonWin;
  final Color colorButtonLoss;
  bool isButtonPressed1;
  bool isButtonPressed2;
  bool isButtonPressed3;
  bool isButtonPressed4;

  card_question_widgets({
    Key? key,
    required this.ranking,
    required this.question,
    required this.firstBranch,
    required this.secondBranch,
    required this.thirdBranch,
    required this.fourthBranch,
    required this.colorButtonWin,
    required this.colorButtonLoss,
    required this.sol,
    required this.isButtonPressed1,
    required this.isButtonPressed2,
    required this.isButtonPressed3,
    required this.isButtonPressed4,
  }) : super(key: key);

  @override
  State<card_question_widgets> createState() => _card_question_widgetsState();
}

class _card_question_widgetsState extends State<card_question_widgets> {
  final AppVariables appVariables = Get.put(AppVariables());
  final AppSize appSize = Get.put(AppSize());

  int count = 50;
  Timer? timer;

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
        count--;
        if (count == 0) {
          timer.cancel();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("انتهى الوقت المسموح", textAlign: TextAlign.center),
          ));
        }
        });
      },
    );
    if (count == widget.sol) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('تهانينا لقد حصلت على 5 نقاط',
                    textAlign: TextAlign.center),
                content: const Text('الانتقال الى قائمة الاسئلة',
                    textAlign: TextAlign.center),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => {
                      Navigator.pop(context, 'موافق'),
                      // Navigator.pop(context),
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => MyApp()),
                      // ),
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }

  Color ColorButton1 = Colors.blueAccent;
  Color ColorButton2 = Colors.blueAccent;
  Color ColorButton3 = Colors.blueAccent;
  Color ColorButton4 = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    // getting the size of the app
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final List Q2 = [
      widget.ranking,
      widget.question,
      widget.firstBranch,
      widget.secondBranch,
      widget.thirdBranch,
      widget.fourthBranch
    ];

    return SizedBox(
      height: 350.0,
      width: width,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                Text("${Q2[0]}"),
                Text(
                  Q2[1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  color: ColorButton1,
                  splashColor: ColorButton1,
                  height: 40.0,
                  minWidth: 250.0,
                  onPressed: () {
                    switch (widget.isButtonPressed1) {
                      case true:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة صحيحة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton1 = Colors.green;
                          print("أجابة صحيحة");
                        }
                        break;
                      case false:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة خاطئة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton2 = Colors.redAccent;
                          ColorButton3 = Colors.redAccent;
                          ColorButton4 = Colors.redAccent;
                          print("أجابة خاطئة");
                        }
                        break;
                      default:
                        {
                          print("Invalid choice");
                        }
                        break;
                    }
                    setState(() {
                      timer?.cancel();
                    });
                  },
                  child: Text(Q2[2], style: const TextStyle(fontSize: 20)),
                  // color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 5,
                ),
                MaterialButton(
                  color: ColorButton2,
                  splashColor: ColorButton2,
                  height: 40.0,
                  minWidth: 250.0,
                  onPressed: () {
                    _incrementCounter();
                    switch (widget.isButtonPressed2) {
                      case true:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة صحيحة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton2 = Colors.green;
                          
                          print("أجابة صحيحة");
                        }
                        break;
                      case false:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة خاطئة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton1 = Colors.redAccent;
                          ColorButton3 = Colors.redAccent;
                          ColorButton4 = Colors.redAccent;
                          
                          print("أجابة خاطئة");
                        }
                        break;
                      default:
                        {
                          print("Invalid choice");
                        }
                        break;
                    }
                    setState(() {
                      timer?.cancel();
                    });
                    // showDialog<String>(
                    //     context: context,
                    //     builder: (BuildContext context) => AlertDialog(
                    //       title: const Text('تهانينا لقد حصلت على 5 نقاط',
                    //           textAlign: TextAlign.center),
                    //       content: const Text('الانتقال الى قائمة الاسئلة',
                    //           textAlign: TextAlign.center),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           onPressed: () => Navigator.pop(context, 'Cancel'),
                    //           child: const Text('Cancel'),
                    //         ),
                    //         TextButton(
                    //           onPressed: () => {
                    //             Navigator.pop(context, 'موافق'),
                    //             // Navigator.pop(context),
                    //             // Navigator.push(
                    //             //   context,
                    //             //   MaterialPageRoute(
                    //             //       builder: (context) => MyApp()),
                    //             // ),
                    //           },
                    //           child: const Text('OK'),
                    //         ),
                    //       ],
                    //     ));
                  },
                  child: Text(Q2[3], style: const TextStyle(fontSize: 20)),
                  // color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 5,
                ),
                MaterialButton(
                  color: ColorButton3,
                  splashColor: ColorButton3,
                  height: 40.0,
                  minWidth: 250.0,
                  onPressed: () {
                    switch (widget.isButtonPressed3) {
                      case true:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة صحيحة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton3 = Colors.green;
                          print("أجابة صحيحة");
                        }
                        break;
                      case false:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة خاطئة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton1 = Colors.redAccent;
                          ColorButton2 = Colors.redAccent;
                          ColorButton4 = Colors.redAccent;
                          
                          print("أجابة خاطئة");
                        }
                        break;
                      default:
                        {
                          print("Invalid choice");
                        }
                        break;
                    }
                    setState(() {
                      timer?.cancel();
                    });
                  },
                  child: Text(Q2[4], style: const TextStyle(fontSize: 20)),
                  // color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 5,
                ),
                MaterialButton(
                  color: ColorButton4,
                  splashColor: ColorButton4,
                  height: 40.0,
                  minWidth: 250.0,
                  onPressed: () {
                    switch (widget.isButtonPressed4) {
                      case true:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة صحيحة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton4 = Colors.green;
                          
                          print("أجابة صحيحة");
                        }
                        break;
                      case false:
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("أجابة خاطئة",
                                textAlign: TextAlign.center),
                          ));
                          ColorButton1 = Colors.redAccent;
                          ColorButton2 = Colors.redAccent;
                          ColorButton3 = Colors.redAccent;

                          print("أجابة خاطئة");
                        }
                        break;

                      default:
                        {
                          print("Invalid choice");
                        }
                        break;
                    }
                    setState(() {
                      timer?.cancel();
                    });
                  },
                  child: Text(Q2[5], style: const TextStyle(fontSize: 20)),
                  // color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 5,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Time Allowed : $count",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // MaterialButton(
                //   color: Colors.blue,
                //   height: 40.0,
                //   minWidth: 250.0,
                //   onPressed: () async {
                //     String url =
                //         "https://www.google.com/search?q=%D8%A7%D9%84%D9%8A+%D9%85%D8%A7%D8%B0%D8%A7+%D9%8A%D8%B4%D9%8A%D8%B1+%D9%85%D8%B5%D8%B7%D9%84%D8%AD+%D8%A7%D9%84%D8%B0%D9%87%D8%A8+%D8%A7%D9%84%D8%A7%D8%B3%D9%88%D8%AF+%D8%9F&oq=%D8%A7%D9%84%D9%8A+%D9%85%D8%A7%D8%B0%D8%A7+%D9%8A%D8%B4%D9%8A%D8%B1+%D9%85%D8%B5%D8%B7%D9%84%D8%AD+%D8%A7%D9%84%D8%B0%D9%87%D8%A8+%D8%A7%D9%84%D8%A7%D8%B3%D9%88%D8%AF+%D8%9F&aqs=chrome..69i57j0i22i30.302j0j7&sourceid=chrome&ie=UTF-8";
                //     var urllaunchable = await canLaunch(
                //         url); //canLaunch is from url_launcher package
                //     if (urllaunchable) {
                //       await launch(
                //           url); //launch is from url_launcher package to launch URL
                //     } else {
                //       print("URL can't be launched.");
                //     }
                //   },
                //   child: const Text("Search on Google",
                //       style: TextStyle(fontSize: 20)),
                //   // color: Colors.blue,
                //   textColor: Colors.white,
                //   elevation: 5,
                // ),
                // CounterScreen(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
