// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, avoid_print, non_constant_identifier_names, text_direction_code_point_in_literal, unnecessary_brace_in_string_interps, prefer_adjacent_string_concatenation, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:wealth_earn/model/vip2.dart';
import 'package:wealth_earn/screens/packages_screeen.dart';
import 'package:wealth_earn/string/app_variable.dart';
import 'package:get/get.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';
import 'package:wealth_earn/model/user_data_model.dart';

import '../config/prefs/pref_utils.dart';

final AppVariables _appVariables = Get.put(AppVariables());

class Vip2 extends StatefulWidget {
  Vip2({Key? key}) : super(key: key);

  @override
  State<Vip2> createState() => _Vip2State();
}

var amount;
var snackBar;

class _Vip2State extends State<Vip2> {
  int? Vip2;
  final TextEditingController _Vip2Controller = TextEditingController();

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
        ),
        // ignore: sized_box_for_whitespace
        body: _Vip2Controller.text == '1'
            ? SingleChildScrollView(
                // physics:
                //     const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      // height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order total amount: \$ 2,354.5',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            'Commission: \$ 337.7‬',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            'Expected return: \$ 2,692.2',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Your amount: " + '${amount}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OutlineButton(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            amount.toDouble() <= 2.922
                                ? CoolAlert.show(
                                    context: context,
                                    type: CoolAlertType.info,
                                    text:
                                        "Your amount is less than the requirements, you must make Your amount  is : \$ 2,692.2",
                                    onConfirmBtnTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Packages()));
                                    })
                                : {
                                    snackBar = const SnackBar(
                                      content: Text(
                                        "Success",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar),
                                    PrefUtils.getTotal(total: "\$ 2,354.5"),
                                    PrefUtils.getCommission(
                                        commission: "\$ 337.7"),
                                    PrefUtils.getExpected(
                                        expected: "\$ 2,692.2"),
                                    _appVariables.pendingGetX.value = "11",
                                    _appVariables.orderGetX.value = "4",
                                    PrefUtils.getPending(
                                        pending:
                                            _appVariables.pendingGetX.value),
                                    PrefUtils.getOrders(
                                        order: _appVariables.orderGetX.value),
                                    Get.to(Wallet()),
                                  };
                          },
                          child: const Text("Submit",
                              style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          // height: height,
                          width: width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: vip2List1.length,
                              physics: const NeverScrollableScrollPhysics(),
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
                                              vip2List1[index]['name']
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          Text(
                                            vip2List1[index]["brand"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "\$ ${vip2List1[index]["price"]}",
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
                                          "assets/images/${vip2List1[index]["image"]}",
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    Container(
                      // height: height / 1.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : _Vip2Controller.text == '2'
                ? SingleChildScrollView(
                    // physics:
                    //     const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          // height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Order total amount: \$ 2,682',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                'Commission: \$ 184.1‬',
                                style: TextStyle(fontSize: 20),
                              ),
                              const Text(
                                'Expected return: \$ 2,866.1',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Your amount: " + '${amount}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OutlineButton(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                amount.toDouble() <= 2.861
                                    ? CoolAlert.show(
                                        context: context,
                                        type: CoolAlertType.info,
                                        text:
                                            "Your amount is less than the requirements, you must make Your amount  is : \$ 2,866.1",
                                        onConfirmBtnTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Packages()));
                                        })
                                    : {
                                        snackBar = const SnackBar(
                                          content: Text(
                                            "Success",
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar),
                                        PrefUtils.getTotal(total: "\$ 2,682"),
                                        PrefUtils.getCommission(
                                            commission: "\$ 184.1"),
                                        PrefUtils.getExpected(
                                            expected: "\$ 2,866.1"),
                                        _appVariables.pendingGetX.value = "12",
                                        _appVariables.orderGetX.value = "3",
                                        PrefUtils.getPending(
                                            pending: _appVariables
                                                .pendingGetX.value),
                                        PrefUtils.getOrders(
                                            order:
                                                _appVariables.orderGetX.value),
                                        Get.to(Wallet()),
                                      };
                              },
                              child: const Text("Submit",
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 2.2,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              // height: height,
                              width: width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: vip2List2.length,
                                  physics: const NeverScrollableScrollPhysics(),
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
                                                  vip2List2[index]['name']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black)),
                                              Text(
                                                vip2List2[index]["brand"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "\$ ${vip2List2[index]["price"]}",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                              "assets/images/${vip2List2[index]["image"]}",
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Container(
                          // height: height / 1.1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : _Vip2Controller.text == '3'
                    ? SingleChildScrollView(
                        // physics:
                        //     const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              //   height:
                              // 500,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Order total amount: \$ 1,500',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                    'Commission: \$ 75',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                    'Expected return: \$ 1,575',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Your amount: " + '${amount}',
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                OutlineButton(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    amount.toDouble() <= 1.575
                                        ? CoolAlert.show(
                                            context: context,
                                            type: CoolAlertType.info,
                                            text:
                                                "Your amount is less than the requirements, you must make Your amount  is : \$ 1,575",
                                            onConfirmBtnTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Packages()));
                                            })
                                        : {
                                            snackBar = const SnackBar(
                                              content: Text(
                                                "Success",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            ),
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar),
                                            PrefUtils.getTotal(
                                                total: "\$ 1,500"),
                                            PrefUtils.getCommission(
                                                commission: "\$ 75"),
                                            PrefUtils.getExpected(
                                                expected: "\$ 1,575"),
                                            _appVariables.pendingGetX.value =
                                                "2",
                                            _appVariables.orderGetX.value =
                                                "13",
                                            PrefUtils.getPending(
                                                pending: _appVariables
                                                    .pendingGetX.value),
                                            PrefUtils.getOrders(
                                                order: _appVariables
                                                    .orderGetX.value),
                                            Get.to(Wallet()),
                                          };
                                  },
                                  child: const Text("Submit",
                                      style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 2.2,
                                          color: Colors.black)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  // height: height,
                                  width: width,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: vip2List3.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                                      vip2List3[index]['name']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black)),
                                                  Text(
                                                    vip2List3[index]["brand"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.grey),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "\$ ${vip2List3[index]["price"]}",
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: Image.asset(
                                                  "assets/images/${vip2List3[index]["image"]}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                            Container(
                              // height: height / 1.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : _Vip2Controller.text == '4'
                        ? SingleChildScrollView(
                            // physics:
                            //     const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Container(
                                  //   height:
                                  // 500,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Order total amount: \$ 2,082',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const Text(
                                        'Commission: \$ 338.5‬',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const Text(
                                        'Expected return: \$ 2,420.5',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "Your amount: " + '${amount}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    OutlineButton(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        amount.toDouble() <= 2.425
                                            ? CoolAlert.show(
                                                context: context,
                                                type: CoolAlertType.info,
                                                text:
                                                    "Your amount is less than the requirements, you must make Your amount  is : \$ 2,420.5",
                                                onConfirmBtnTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Packages()));
                                                })
                                            : {
                                                snackBar = const SnackBar(
                                                  content: Text(
                                                    "Success",
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ),
                                                ),
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar),
                                                PrefUtils.getTotal(
                                                    total: "\$ 2082"),
                                                PrefUtils.getCommission(
                                                    commission: "\$ 338.5"),
                                                PrefUtils.getExpected(
                                                    expected: "\$ 2,420.5"),
                                                _appVariables
                                                    .pendingGetX.value = "14",
                                                _appVariables.orderGetX.value =
                                                    "1",
                                                PrefUtils.getPending(
                                                    pending: _appVariables
                                                        .pendingGetX.value),
                                                PrefUtils.getOrders(
                                                    order: _appVariables
                                                        .orderGetX.value),
                                                Get.to(Wallet()),
                                              };
                                      },
                                      child: const Text("Submit",
                                          style: TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 2.2,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      // height: height,
                                      width: width,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: vip2List4.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, int index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          vip2List4[index]
                                                                  ['name']
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black)),
                                                      Text(
                                                        vip2List4[index]
                                                                ["brand"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.grey),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "\$ ${vip2List4[index]["price"]}",
                                                        style: const TextStyle(
                                                            fontSize: 25,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                      "assets/images/${vip2List4[index]["image"]}",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                                Container(
                                  // height: height / 1.1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : _Vip2Controller.text == '5'
                            ? SingleChildScrollView(
                                // physics:
                                //     const NeverScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    Container(
                                      // height: 500,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Order total amount: \$ 2,924.25',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          const Text(
                                            'Commission: \$ 345.7‬',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          const Text(
                                            'Expected return: \$ 3,184.65',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            "Your amount: " + '${amount}',
                                            style: const TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        OutlineButton(
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 2),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          onPressed: () {
                                            amount.toDouble() <= 3.465
                                                ? CoolAlert.show(
                                                    context: context,
                                                    type: CoolAlertType.info,
                                                    text:
                                                        "Your amount is less than the requirements, you must make Your amount  is : \$ 3,184.65",
                                                    onConfirmBtnTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Packages()));
                                                    })
                                                : {
                                                    snackBar = const SnackBar(
                                                      content: Text(
                                                        "Success",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                    ),
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar),
                                                    PrefUtils.getTotal(
                                                        total: "\$ 2,924.25"),
                                                    PrefUtils.getCommission(
                                                        commission:
                                                            "\$ 345.7‬"),
                                                    PrefUtils.getExpected(
                                                        expected:
                                                            "\$ 3,184.65"),
                                                    _appVariables.pendingGetX
                                                        .value = "15",
                                                    _appVariables
                                                        .orderGetX.value = "0",
                                                    PrefUtils.getPending(
                                                        pending: _appVariables
                                                            .pendingGetX.value),
                                                    PrefUtils.getOrders(
                                                        order: _appVariables
                                                            .orderGetX.value),
                                                    Get.to(Wallet()),
                                                  };
                                          },
                                          child: const Text("Submit",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: 2.2,
                                                  color: Colors.black)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          // height: height,
                                          width: width,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: vip2List5.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder:
                                                  (context, int index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                              vip2List5[index]
                                                                      ['name']
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black)),
                                                          Text(
                                                            vip2List5[index]
                                                                    ["brand"]
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "\$ ${vip2List5[index]["price"]}",
                                                            style: const TextStyle(
                                                                fontSize: 25,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        width: 50,
                                                        child: Image.asset(
                                                          "assets/images/${vip2List5[index]["image"]}",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      // height: height / 1.1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
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
      _Vip2Controller.text = user.vip2.toString();
    });

    print("Vip2Vip2Vip2Vip2");
    print(Vip2);
    return user;
  }
}
