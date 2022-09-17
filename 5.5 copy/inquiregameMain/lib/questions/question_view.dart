import 'package:flutter/material.dart';
import 'package:inquiregame/questions/questions.dart';
import 'package:inquiregame/widgets/card_question_widgets.dart';

class questions_view extends StatefulWidget {
  const questions_view({Key? key}) : super(key: key);

  @override
  State<questions_view> createState() => _questions_viewState();
}

class _questions_viewState extends State<questions_view> {
  @override
  Widget build(BuildContext context) {
    print(Questions.twoDList[0][10]);
    print("Questions.twoDList[index][10]");
    return Scaffold(
        appBar: AppBar(
          title: Text("widget.title"),
          actions: [
            IconButton(
                icon: const Icon(Icons.switch_camera_rounded,), onPressed: () {  },
            ),
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
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: card_question_widgets(
                    ranking: Questions.twoDList[index][0],// ranking.
                    question: Questions.twoDList[index][1],
                    firstBranch: Questions.twoDList[index][2],
                    secondBranch: Questions.twoDList[index][3],
                    thirdBranch: Questions.twoDList[index][4],
                    fourthBranch: Questions.twoDList[index][5],
                    isButtonPressed1: Questions.twoDList[index][7],
                    isButtonPressed2: Questions.twoDList[index][8],
                    isButtonPressed3: Questions.twoDList[index][9],
                    isButtonPressed4: Questions.twoDList[index][10],
                    colorButtonWin: Colors.blueAccent,
                    colorButtonLoss: Colors.redAccent,
                    sol: Questions.twoDList[index][6],
                  ),
                );
              }),
        ));
  }
}

/// wedgits questions.

/// itemCount: 19,
// card_question_widgets(
// ranking: Questions.twoDList[index][0],// ranking.
// question: Questions.twoDList[index][1],
// firstBranch: Questions.twoDList[index][2],
// secondBranch: Questions.twoDList[index][3],
// thirdBranch: Questions.twoDList[index][4],
// fourthBranch: Questions.twoDList[index][5],
// isButtonPressed: true,
// colorButtonWin: Colors.blueAccent,
// colorButtonLoss: Colors.redAccent,
// sol: Questions.twoDList[index][6],
// ),