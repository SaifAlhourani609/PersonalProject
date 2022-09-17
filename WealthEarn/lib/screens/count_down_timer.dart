import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:wealth_earn/screens/packages_screeen.dart';
import 'package:wealth_earn/screens/vip1Screen.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key? key}) : super(key: key);

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

final TextEditingController _timeController = TextEditingController();

class _CountDownTimerState extends State<CountDownTimer> {

  var dt = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timeController.text = '${dt.hour}' + ':' + '${dt.minute}' + ':' + '${dt.second}';
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double height = MediaQuery.of(context).size.height / 3;

    return Scaffold(
      backgroundColor: const Color(0xff1a1830),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1a1830),
        // ignore: prefer_const_constructors
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Packages(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
      SizedBox(
      height: MediaQuery.of(context).size.height / 40),
          const Text(
            'Welcome Back',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Nunito'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          Text(
            "Time : " +_timeController.text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Nunito'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          Padding(
              padding:
              const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  const [
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your day mission will expire when the timer runs out.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nunito'),
                  ),
                  Text(
                    'You must complete your orders within 24 hours.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nunito'),
                  ),
                  Text(
                    'Be aware that you must complete your daily tasks . in order to withdraw your revenues.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nunito'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '-When you submit your first order, you must finish your orders before the next day come\nor your amount will freeze for misbehavior',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nunito'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '-Please avoid being late for your clients.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nunito'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Note : Wealth Earn Company will contribute by paying a percentage '
                        'of the amount of orders that you will make.. \nYou will notice that as you complete each 5 orders, you will receive bounces.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Nunito'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              )),
          SizedBox(height: 20,),
          OutlineButton(
            borderSide:
            const BorderSide(color: Colors.white, width: 2),
            padding:  const EdgeInsets.symmetric(horizontal: 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Vip1()));
            },
            child: const Text("Start",
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.2,
                    color: Colors.white)),
          ),
        ],
      ),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
