import 'package:al_quran/widgets/app_version.dart';
import 'package:al_quran/widgets/drawer_app_name.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/model/utils/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final List<DrawerListItem> _items = [
    DrawerListItem(
      iconData: Icons.format_list_numbered,
      title: 'Surah - سورة',
      route: '/surahIndex',
    ),
    DrawerListItem(
      iconData: Icons.format_list_bulleted,
      title: 'Juz - جزء',
      route: '/juzIndex',
    ),
    DrawerListItem(
      iconData: Icons.format_align_left,
      title: 'Sajda - سجدة',
      route: '/sajda',
    ),
    DrawerListItem(
      iconData: Icons.info,
      title: 'Help Guide - دليل المساعدة',
      route: '/help',
    ),
    DrawerListItem(
      iconData: Icons.share,
      title: 'Share App - مشاركة التطبيق',
      route: '/shareApp',
    ),
    DrawerListItem(
      iconData: Icons.book_outlined,
      title: 'Quotes by the Prophet - أحاديث نبوية',
      route: '/Hadeth',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.835,
      height: height,
      child: Material(
        color: themeChange.darkTheme ? Colors.grey[800] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const DrawerAppName(),
              Column(
                children: _items
                    .map(
                      (tile) => Card(
                        color: themeChange.darkTheme
                            ? Colors.grey[700]
                            : Colors.white,
                        child: ListTile(
                          leading: Icon(tile.iconData),
                          title: Text(tile.title!),
                          onTap: () => Navigator.pushNamed(
                            context,
                            tile.route!,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}
