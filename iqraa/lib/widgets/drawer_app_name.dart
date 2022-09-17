import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerAppName extends StatelessWidget {
  const DrawerAppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: width * 0.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Transform.scale(
              scale: 1.2,
              child: Switch(
                activeColor: Colors.grey[500],
                value: themeChange.darkTheme,
                onChanged: (value) {
                  themeChange.darkTheme = value;
                },
              ),
            ),
            SizedBox(width: width * 0.2),
            // Text(
            //   "\nThe",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w500,
            //     fontSize: height * 0.025,
            //     color:
            //         themeChange.darkTheme ? Colors.grey[200] : Colors.black54,
            //   ),
            // ),
            Row(
              children: [
                const SizedBox(width: 10,),
                Text(
                  "Iqra'a",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        themeChange.darkTheme ? Colors.grey[200] : Colors.black54,
                    fontSize: height * 0.035,
                  ),
                ),
              ],
            ),
          ],
        ),
        Image.asset('assets/grad_logo.png', height: height * 0.17),
        SizedBox(width: width * 0.0),
      ],
    );
  }
}
