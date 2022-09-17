import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../string/app_size.dart';
import '../string/app_variable.dart';

class HomeGuestModeAppBarWidget extends StatelessWidget {
  const HomeGuestModeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppVariables appVariables = Get.put(AppVariables());
    final AppSize appSize = Get.put(AppSize());

    // getting the size of the app
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      height: 300.0,
      width: width,
      child: CustomPaint(
        painter: CurvePainter(),
      ),
    );
  }
}

// RaisedButton(
// child: Text("Open"),
// onPressed: () {},
// ),

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    Color colorOne = Colors.black12;
    Color colorTwo = Colors.deepOrange;
    Color colorThree = Colors.indigo;

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.20,
        size.width * 0.60, size.height * 0.50);
    // path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, sizes5, size.height*0.65);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.40, size.width, 0);
    path.close();

    paint.color = colorThree;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.20,
        size.width * 0.50, size.height * 0.60);
    // path.quadraticBezierTo(size.width*0.20, size.height*0.45, size.width*0.27, size.height*0.60);
    // path.quadraticBezierTo(size.width*0.45, size.height, size.width*0.50, size.height*0.80);
    // path.quadraticBezierTo(size.width*0.55, size.height*0.45, size.width*0.75, size.height*0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.10);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorTwo;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.99);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.50,
        size.width * 0.42, size.height * 0.52);
    // path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
    // path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.05);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorOne;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
