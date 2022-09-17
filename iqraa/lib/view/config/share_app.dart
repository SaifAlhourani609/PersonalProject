import 'package:al_quran/widgets/app_version.dart';
import 'package:al_quran/widgets/back_btn.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:al_quran/share_icon_icons.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const <Widget>[
            BackBtn(),
            CustomTitle(
              title: 'Share App',
            ),
            ShareInfo()
          ],
        ),
      ),
    );
  }
}

class ShareInfo extends StatelessWidget {
  const ShareInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.13),
          Image.asset('assets/grad_logo.png', height: height * 0.3),
          SizedBox(height: height * 0.02),
          SizedBox(height: height * 0.05),
          const ShareAppBtn(),
          SizedBox(height: height * 0.02),
          const ShareCustomBtns(
            iconData: ShareIcon.googlePlay,
            text: 'Rate & Feedback',
            url: "",
          ),
          SizedBox(height: height * 0.02),
          SizedBox(height: height * 0.05),
          const AppVersion()
        ],
      ),
    );
  }
}

class ShareCustomBtns extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final String? url;
  const ShareCustomBtns({
    Key? key,
    required this.iconData,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                iconData,
                size: MediaQuery.of(context).size.height * 0.03,
                color: Provider.of<DarkThemeProvider>(context).darkTheme
                    ? Colors.black
                    : Colors.white,
              ),
              Text(
                "  $text",
                style: TextStyle(
                  color: Provider.of<DarkThemeProvider>(context).darkTheme
                      ? Colors.black
                      : Colors.white,
                ),
              )
            ],
          ),
          onPressed: () => launch("$url"),
        ),
      ),
    );
  }
}

class ShareAppBtn extends StatefulWidget {
  const ShareAppBtn({Key? key}) : super(key: key);

  @override
  _ShareAppBtnState createState() => _ShareAppBtnState();
}

class _ShareAppBtnState extends State<ShareAppBtn> {
  // String text = "Download the latest no-Ads Iqra'a App on Play store\n\n"
  //     "\"URL\" \n\nShare More! It is Sadaq-e-Jaria :)";

  String text = "Please read this invitation to accomplish good actions together by downloading the program.\n\nيرجى تحميل تطبيق إقرأ، هذه الدعوة لكسب الأجر معاً إن شاء الله";

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;

  Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.share,
                  size: MediaQuery.of(context).size.height * 0.03,
                  color: Provider.of<DarkThemeProvider>(context).darkTheme
                      ? Colors.black
                      : Colors.white,
                ),
                Text(
                  "  Invite Friends",
                  style: TextStyle(
                    color: Provider.of<DarkThemeProvider>(context).darkTheme
                        ? Colors.black
                        : Colors.white,
                  ),
                )
              ],
            ),
            onPressed: () => share(context)),
      ),
    );
  }
}
