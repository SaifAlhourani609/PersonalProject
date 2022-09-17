import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class MarqueeTextPage extends StatefulWidget {
  final String text;

  MarqueeTextPage({
    required this.text,
  }) : super();

  @override
  _MyVideoPlayerPageState createState() => _MyVideoPlayerPageState();
}

class _MyVideoPlayerPageState extends State<MarqueeTextPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Expanded(
              child: Marquee(
            text: widget.text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF010312)
                  : const Color(0xFF010312)),
            scrollAxis: Axis.horizontal,
            //scroll direction
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 50.0,
            //speed
            pauseAfterRound: const Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: const Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: const Duration(milliseconds: 300),
            decelerationCurve: Curves.easeOut,
          ))
        ],
      ),
    );
  }
}

// marquee: ^2.2.0