import 'package:flutter/material.dart';
import 'package:wealth_earn/model/vip3.dart';
import 'package:wealth_earn/screens/count_down_timer.dart';
import 'package:wealth_earn/screens/packages_screeen.dart';

import 'package:wealth_earn/string/app_variable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';
import 'package:wealth_earn/model/user_data_model.dart';

final AppVariables _appVariables = Get.put(AppVariables());

class Vip3 extends StatefulWidget {
  Vip3({Key? key}) : super(key: key);

  @override
  State<Vip3> createState() => _Vip3State();
}

class _Vip3State extends State<Vip3> {
  int? vip3;
  final TextEditingController _vip3Controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _getRecord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Make Your Order'),
          leading: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Packages(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 200),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
        ),
        // ignore: sized_box_for_whitespace
        body: _vip3Controller.text == '1'
            ? ListView.builder(
            itemCount: vip3List1.length,
            // physics: const BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(vip3List1[index]['name'].toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black)),
                        Text(
                          vip3List1[index]["brand"].toString(),
                          style: const TextStyle(
                              fontSize: 17, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ ${vip3List1[index]["price"]}",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/images/${vip3List1[index]["image"]}",
                      ),
                    ),
                  ],
                ),
              );
            })
            : _vip3Controller.text == '2'
            ? ListView.builder(
            itemCount: vip3List2.length,
            // physics: const BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(vip3List2[index]['name'].toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black)),
                        Text(
                          vip3List2[index]["brand"].toString(),
                          style: const TextStyle(
                              fontSize: 17, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ ${vip3List2[index]["price"]}",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/images/${vip3List2[index]["image"]}",
                      ),
                    ),
                  ],
                ),
              );
            })
            : _vip3Controller.text == '3'
            ? ListView.builder(
            itemCount: vip3List3.length,
            // physics: const BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(vip3List3[index]['name'].toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black)),
                        Text(
                          vip3List3[index]["brand"].toString(),
                          style: const TextStyle(
                              fontSize: 17, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ ${vip3List3[index]["price"]}",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/images/${vip3List3[index]["image"]}",
                      ),
                    ),
                  ],
                ),
              );
            })
            : _vip3Controller.text == '4'
            ? ListView.builder(
            itemCount: vip3List4.length,
            // physics: const BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            vip3List4[index]['name'].toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black)),
                        Text(
                          vip3List4[index]["brand"].toString(),
                          style: const TextStyle(
                              fontSize: 17, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ ${vip3List4[index]["price"]}",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/images/${vip3List4[index]["image"]}",
                      ),
                    ),
                  ],
                ),
              );
            })
            : _vip3Controller.text == '5'
            ? ListView.builder(
            itemCount: vip3List5.length,
            // physics: const BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            vip3List5[index]['name']
                                .toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black)),
                        Text(
                          vip3List5[index]["brand"]
                              .toString(),
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$ ${vip3List5[index]["price"]}",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        "assets/images/${vip3List5[index]["image"]}",
                      ),
                    ),
                  ],
                ),
              );
            })
            : const SizedBox());
  }

  Future<MyUser> _getRecord() async {
    var future = await collection
        .where('email', isEqualTo: _appVariables.emailGetX.value)
        .get();
    var docs = future.docs;
    print(docs.first.data());
    MyUser user = MyUser.fromJson(docs.first.data());

    setState(() {
      _vip3Controller.text = user.vip3.toString();
    });

    print("Vip3Vip3Vip3Vip3");
    print(vip3);
    return user;
  }

}
