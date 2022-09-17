import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/botombar.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/dark_mode_controller/theme_style.dart';
import 'package:al_quran/db/mydata.dart';
import 'package:al_quran/model/ayat/ayat.dart';
import 'package:al_quran/model/hadithe.dart';
import 'package:al_quran/model/juzz/juz.dart';
import 'package:al_quran/model/juzz/juz_list.dart';
import 'package:al_quran/model/sajda/sajda.dart';
import 'package:al_quran/model/sajda/sajda_list.dart';
import 'package:al_quran/model/surah/surah.dart';
import 'package:al_quran/model/surah/surah_list.dart';
import 'package:al_quran/view/config/help.dart';
import 'package:al_quran/view/config/share_app.dart';
import 'package:al_quran/view/juzz/juz_index.dart';
import 'package:al_quran/view/home/home.dart';
import 'package:al_quran/view/sajda/sajda_index.dart';
import 'package:al_quran/view/surahas/surah_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

  // hive
  await Hive.initFlutter();

  // hive adapter
  Hive.registerAdapter<Ayat>(AyatAdapter());

  Hive.registerAdapter<JuzList>(JuzListAdapter());
  Hive.registerAdapter<JuzAyahs>(JuzAyahsAdapter());

  Hive.registerAdapter<SajdaList>(SajdaListAdapter());
  Hive.registerAdapter<SajdaAyat>(SajdaAyatAdapter());

  Hive.registerAdapter<SurahsList>(SurahsListAdapter());
  Hive.registerAdapter<Surah>(SurahAdapter());

  // box
  await Hive.openBox('data');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePref.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ChangeNotifierProvider(create: (_) {
      return darkThemeProvider;
    }, child: Consumer<DarkThemeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: "Iqra'a",
          debugShowCheckedModeBanner: false,
          theme: ThemeStyles.themeData(darkThemeProvider.darkTheme, context),
          home: Builder(
            builder: (context) => HomeScreen(
              maxSlide: MediaQuery.of(context).size.width * 0.835,
            ),
          ),
          initialRoute: initScreen == 0 || initScreen == null
              ? '/introduction'
              : '/homeScreen',
          routes: <String, WidgetBuilder>{
            '/homeScreen': (context) => HomeScreen(
                  maxSlide: MediaQuery.of(context).size.width * 0.835,
                ),
            '/surahIndex': (context) => const SurahIndex(),
            '/sajda': (context) => const Sajda(),
            '/juzIndex': (context) => const JuzIndex(),
            '/help': (context) => const Help(),
            '/shareApp': (context) => const ShareApp(),
            '/Hadeth': (context) => const Hadeth(),
          },
        );
      },
    ));
  }
}

class Hadeth extends StatelessWidget {
  const Hadeth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(
            child: themeChange.darkTheme
                ? const Text(
              "فهرس الأربعين النووية",
              style: TextStyle(color: Colors.white, fontSize: 20),
              textDirection: TextDirection.rtl,
            ) : const Text(
              "فهرس الأربعين النووية",
              style: TextStyle(color: Colors.black, fontSize: 20),
              textDirection: TextDirection.rtl,
            ),
          ),
          backgroundColor: themeChange.darkTheme ? Colors.grey[800] : Colors.white,
        ),
        body: CollapsingList(),
        //body: NetworkingPage(),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: Container(
            color: Colors.lightBlue, child: Center(child: Text(headerText))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return FutureBuilder<List<Hadith>>(

        //we call the method, which is in the folder db file database.dart
        future: Mydata.getAlldata(),
        builder: (BuildContext context, AsyncSnapshot<List<Hadith>> snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              //Count all records

              itemCount: snapshot.data!.length,
              //all the records that are in the Operation table are passed to an item Operation item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index) {
                Hadith item = snapshot.data![index];
                //delete one register for id
                return WidgetAnimator(
                   child: Card(
                  margin: const EdgeInsets.all(3.0),
                  elevation: 1.0,
                  // shape: const RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: ListTile(
                    title: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                          style:
                              const TextStyle(fontSize: 20, color: Colors.black),
                          children: [
                            TextSpan(
                                text: item.key! + ': ',
                                style: const TextStyle(color: Colors.black)),
                            TextSpan(
                                text: item.nameHadith,
                                style:
                                    const TextStyle(color: Colors.black))
                          ]),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      item.textHadith!.substring(0, 120) + '...',
                      textDirection: TextDirection.rtl,
                    ),
                    trailing: const Icon(
                      Icons.library_books,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              //HadithPage(hadith: item,)
                              HomeHadith(
                                hadith: item,
                              )));
                    },
                  ),
                ),

                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
