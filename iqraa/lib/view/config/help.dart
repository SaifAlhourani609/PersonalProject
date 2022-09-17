import 'package:al_quran/widgets/app_version.dart';
import 'package:al_quran/widgets/back_btn.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomImage(
              imagePath: "assets/grad_logo.png",
              opacity: 0.5,
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            const BackBtn(),
            const CustomTitle(title: "Help Guide"),
            const Guidelines(),
            const AppVersion(),
          ],
        ),
      ),
    );
  }
}

class Guidelines extends StatelessWidget {
  const Guidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, height * 0.1),
      child: ListView(
        children: const <Widget>[
          GuideContainer(
            // guideNo: 1,
            title: "Internet Connectivity",
            guideDescription:
                "For now, the app is available in Offline and Online reading mode."
          ),
          GuideContainer2(
              // guideNo: guideNo,
              title: "الاتصال بشبكة الإنترنت",
              guideDescription:
              "في الوقت الحالي ، التطبيق متاح في وضع القراءة "
                  "\n"
                  "                  دون اتصال بالإنترنت"
          ),
          GuideContainer(
            title: "Juzz - Surah",
            // guideNo: 2,
            guideDescription:
                "Open any Juzz, Surah or Sajda directly from index. It has all 30 chapters and 114 surahs. Press and hold any Surah or Sajda for viewing a brief information about it.",
          ),
          GuideContainer2(
            // guideNo: guideNo,
              title: "جزء - سورة",
              guideDescription:
              "افتح أي سورة أو سجدة أو جزء مباشرة من الفهرس. يحتوي على "
                  "\n                         "
                  "30 فصلاً و 114 سورة "
                  "\n        "
                  " اضغط مع الاستمرار على أي سورة أو سجدة لعرض "
                  "\n                          "
                  "معلومات مختصرة عنها "
          ),
          GuideContainer(
            title: "Sajda",
            guideDescription:
            "Open any Sajda Ayah directly from index. It has all 15 Sajdas. Further there will be information about every Sajda inside, including Juzz, Ruku and Chapter type of Surah",
          ),
          GuideContainer(
            // guideNo: 3,
            title: "سجدة",
            guideDescription:
                "افتح أي آية او سورة مباشرة من الفهرس. يضم كل 15 سجدا."
                    "\n     "
                    " علاوة على ذلك ، ستكون هناك معلومات حول كل سجدة "
                    "\n     "
                    "بالداخل ، بما في ذلك الجزء و الآية ونوع الفصل من "
                    "\n                                   "
                    "السورة",
          ),
          GuideContainer(
            // guideNo: 4,
            title: "Rate & Feedback",
            guideDescription:
                "You can give your precious feedback and rate our app on Google play store.",
          ),
          GuideContainer(
            // guideNo: 4,
            title: "التقييم والأداء",
            guideDescription:
            "يمكنك تقديم ملاحظاتك الثمينة وتقييم تطبيقنا على متجر"
                "\n                         "
                " Google play",
          ),
          GuideContainer(
            // guideNo: 5,
            title: "Reporting a Mistake",
            guideDescription:
                // "If you see any mistake in context of this Holy Book please report at the following link: \n\n\"URL\"",
                "If you see any mistake in context of this Holy Book please report at the following link:",
          ),
          GuideContainer(
            // guideNo: 5,
            title: "التبليغ عن خطأ",
            guideDescription:
            "إذا رأيت أي خطأ في سياق هذا الكتاب المقدس يرجى الإبلاغنا "
                // "\n                          "
                // ":على الرابط التالي \n\n\""
                // "العنوان\"",
          ),
          GuideContainer(
            // guideNo: 6,
            title: "Developer's Info - معلومات المطورين",
            guideDescription:
                "Name: \n    1- Saif Al-Hourani\n    2- Motasem Al-Tamimi\n    3- Suhaib Tawarh\nEmail: \n    1- saifalhourani609@gmail.com\n    2- motasem.shawar9@gmail.com\n    3- suhaibnayil@gmail.com\n",
          ),
        ],
      ),
    );
  }
}

class GuideContainer extends StatelessWidget {
  final String title;
  final String guideDescription;
  // final int? guideNo;

  const GuideContainer(
      {Key? key,
        // this.guideNo,
      required this.title,
      required this.guideDescription})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            "\n $title",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            guideDescription,
            textAlign: TextAlign.justify,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
        ],
      ),
    );
  }
}

class GuideContainer2 extends StatelessWidget {
  final String title;
  final String guideDescription;
  // final int? guideNo;

  const GuideContainer2(
      {Key? key,
        // this.guideNo,
        required this.title,
        required this.guideDescription})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "\n $title",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            guideDescription,
            textAlign: TextAlign.justify,
            style:
            TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
        ],
      ),
    );
  }
}