import 'dart:async';

import 'package:demo/widget_json.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_view/quiz_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dynamic Widget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ElevatedButton(
                    child: Text("Dynamic Widget Json String Export Example"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JSONExporter()));
                    },
                  )
                ]),
              )),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildListDelegate([
                ElevatedButton(
                  child: Text(containerJson[5] +
                      containerJson[6] +
                      containerJson[7] +
                      containerJson[8]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(containerJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Row"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(rowJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Question 2"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(columnJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Text"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(textJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("SelectableText"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(selectableTextJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("TextSpan"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(textSpanJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Icon"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(iconJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("DropCapText"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(dropCapTextJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("DropCapText with Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(dropCapTextImageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("RaisedButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(raisedButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ElevatedButton"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(elevatedButtonJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Asset Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(assetImageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Network Image"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(networkImageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Placeholder"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(placeholderJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("GridView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(gridviewJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ListView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(listviewJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("PageView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(pageviewJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Expanded"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(expandedJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ListView Auto load more"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(listviewLoadmoreJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("GridView Auto load more"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(gridviewloadmoreJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Stack and Positioned"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(stackJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("IndexedStack"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(indexedstackJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("SizedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(sizedboxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Opacity"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(opacityJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Wrap"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(wrapJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ClipRRect"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(cliprrectJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("SafeArea"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(safeareaJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("ListTile"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(listTileJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Scaffold & AppBar"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(scaffoldAppBarJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("LimitedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(limitedboxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Offstage"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(offstageJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("OverflowBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(overflowboxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Divider"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(dividerJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("RotatedBox"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(rotatedBoxJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("Card"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodeEditorPage(cardJson)));
                  },
                ),
                ElevatedButton(
                  child: Text("SingleChildScrollView"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CodeEditorPage(singleChildScrollViewJson)));
                  },
                ),
              ]),
            ),
          ),
        ]));
  }
}

class CodeEditorPage extends StatefulWidget {
  final String jsonString;

  CodeEditorPage(this.jsonString);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CodeEditorPageState(jsonString);
  }
}

class _CodeEditorPageState extends State<CodeEditorPage> {
  String jsonString;
  TextEditingController controller = TextEditingController();

  _CodeEditorPageState(this.jsonString);

  var quastion = '';

  @override
  void initState() {
    for (var i = 0; i < jsonString.length; i++) {
      if (jsonString[i] == '/') {
        if (jsonString[i + 1] == '@') {
          for (var j = 0; j < jsonString.length; j++) {
            quastion = jsonString[j];
            print(quastion);
          }
        }
      }
      break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Code Editor"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height / 1.14,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Preview"),
                onPressed: () {
                  setState(() {
                    jsonString = controller.text;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PreviewPage(controller.text)));
                },
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.25,
                width: MediaQuery.of(context).size.width / 1.05,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(width: 20, height: 20),
                    SizedBox(
                      width: 20,
                      height: MediaQuery.of(context).size.height / 1.25,
                      child: QuizView(
                        image: Container(
                          width: 150,
                          height: 150,
                          child: Image.network(
                              "https://yt3.ggpht.com/a/AATXAJyPMywRmD62sfK-1CXjwF0YkvrvnmaaHzs4uw=s900-c-k-c0xffffffff-no-rj-mo"),
                        ),
                        showCorrect: true,
                        tagBackgroundColor: Colors.deepOrange,
                        // tagColor: Colors.black,
                        questionTag: (((jsonString.substring(13, 24))
                                    .replaceAll('"', ''))
                                .replaceAll(',', ''))
                            .replaceAll(' ', ''),
                        answerColor: Colors.white,
                        answerBackgroundColor:
                            Color.fromARGB(205, 205, 34, 154),
                        questionColor: Colors.white,
                        backgroundColor: Color.fromARGB(205, 111, 25, 205),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 500,
                        question: quastion,
                        rightAnswer:
                        // (((jsonString.substring(130, 140))
                        //         .replaceAll('"', ''))
                        //     .replaceAll(',', '')),
                        (((jsonString[13] +
                                        jsonString[14] +
                                        jsonString[15] +
                                        jsonString[16] +
                                        jsonString[17] +
                                        jsonString[18] +
                                        jsonString[19] +
                                        jsonString[20] +
                                        jsonString[21] +
                                        jsonString[22] +
                                        jsonString[23])
                                    .replaceAll('"', ''))
                                .replaceAll(',', ''))
                            .replaceAll(' ', ''),
                        wrongAnswers: [
                          quastion,
                          (((jsonString.substring(10, 10)).replaceAll('"', ''))
                              .replaceAll(',', '')),
                          (((jsonString.substring(10, 10)).replaceAll('"', ''))
                              .replaceAll(',', '')),
                          // (((jsonString.substring(141, 300))
                          //     .replaceAll('"', ''))
                          //     .replaceAll(',', '')),
                          // (((jsonString.substring(141, 300))
                          //     .replaceAll('"', ''))
                          //     .replaceAll(',', '')),
                        ],
                        onRightAnswer: () => print("Right"),
                        onWrongAnswer: () => print("Wrong"),
                      ),
                    ),
                    ElevatedButton(
                      child: Text("none"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
    controller.text = jsonString;
    return widget;
  }
}

// ignore: must_be_immutable
class PreviewPage extends StatelessWidget {
  final String jsonString;

  PreviewPage(this.jsonString);

  late DynamicWidgetJsonExportor? _exportor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Preview"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Widget?>(
              future: _buildWidget(context),
              builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? _exportor = DynamicWidgetJsonExportor(
                        child: snapshot.data,
                      )
                    : Text("Loading...");
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              var exportJsonString = _exportor?.exportJsonString();
              if (exportJsonString != null)
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CodeEditorPage(exportJsonString)));
            },
            child: Text("export json code"),
          )
        ],
      ),
    );
  }

  Future<Widget?> _buildWidget(BuildContext context) async {
    return DynamicWidgetBuilder.build(
        jsonString, context, new DefaultClickListener());
  }
}

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    print("Receive click event: " + (event == null ? "" : event));
  }
}

class JSONExporter extends StatefulWidget {
  @override
  _JSONExporterState createState() => _JSONExporterState();
}

class _JSONExporterState extends State<JSONExporter> {
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("export example"),
      ),
      body: Builder(
        builder: (context) => Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: DynamicWidgetJsonExportor(
                  key: key,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.asset("assets/vip.png"),
                      Positioned(
                        child: Image.asset("assets/vip.png"),
                        top: 50,
                        left: 50,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text("Export"),
                  onPressed: () {
                    var exportor =
                        key.currentWidget as DynamicWidgetJsonExportor;
                    var exportJsonString = exportor.exportJsonString();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("json string was exported to editor page.")));
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CodeEditorPage(exportJsonString)));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
