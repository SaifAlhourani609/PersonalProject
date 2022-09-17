// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wealth_earn/config/prefs/pref_utils.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';
import 'package:wealth_earn/model/user_data_model.dart';
import 'package:wealth_earn/model/vip1.dart';
import 'package:wealth_earn/screens/count_down_timer.dart';
import 'package:wealth_earn/screens/packages_screeen.dart';
import 'package:wealth_earn/screens/products_screen.dart';

import 'package:wealth_earn/string/app_variable.dart';
import 'package:get/get.dart';

final AppVariables _appVariables = Get.put(AppVariables());

class Vip1 extends StatefulWidget {
  Vip1({Key? key}) : super(key: key);

  @override
  State<Vip1> createState() => _Vip1State();
}

var amount;
var snackBar;

class _Vip1State extends State<Vip1> {
  int? Vip1;

  // ignore: non_constant_identifier_names
  final TextEditingController _Vip1Controller = TextEditingController();

  double? total = 0.0;

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
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Make Your Order", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.white,
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => const CountDownTimer(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: const Duration(milliseconds: 200),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black,),
          ),
          centerTitle: true,
        ),
        // ignore: sized_box_for_whitespace
        body: _Vip1Controller.text == '0'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: height / 1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const Text(
                      'Order total amount: \$ 22.96',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 1.15',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 24.10',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OutlineButton(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      amount.toDouble() <= 22.96 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 24.10",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }
                      ) : {
                        PrefUtils.getTotal(
                            total: "\$ 22.96"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 1.15"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 24.10"
                        ),
                        _appVariables.pendingGetX.value = "0",
                        _appVariables.orderGetX.value = "15",
                        PrefUtils.getPending(
                            pending: _appVariables.pendingGetX.value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables.orderGetX.value
                        ),
                        Get.to(Wallet()),
                        snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar)
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
                        itemCount: vip1List0.length,
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
                                    Text(vip1List0[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List0[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List0[index]["price"]}",
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
                                    "assets/images/${vip1List0[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '1'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: height / 1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const Text(
                      'Order total amount: \$ 25.94',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 1.3',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 27.24',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OutlineButton(
                    borderSide:
                    const BorderSide(color: Colors.blue, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      amount.toDouble() <= 25.94 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 27.24",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
                        snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 25.94"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 1.3"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 27.24"
                        ),
                        _appVariables.pendingGetX.value = "1",
                        _appVariables.orderGetX.value = "14",
                        PrefUtils.getPending(
                            pending: _appVariables.pendingGetX.value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables.orderGetX.value
                        ),
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
                        itemCount: vip1List1.length,
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
                                    Text(vip1List1[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List1[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List1[index]["price"]}",
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
                                    "assets/images/${vip1List1[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '2'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order total amount: \$ 26.94',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 1.35',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 28.29',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 26.94 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
                        snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 26.94"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 1.35"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 28.29"
                        ),
                        _appVariables.pendingGetX.value = "2",
                        _appVariables.orderGetX.value = "13",
                        PrefUtils.getPending(
                            pending: _appVariables.pendingGetX.value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables.orderGetX.value
                        ),
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
                        itemCount: vip1List2.length,
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
                                    Text(vip1List2[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List2[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List2[index]["price"]}",
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
                                    "assets/images/${vip1List2[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '3'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order total amount: \$ 39.46',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 1.98',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 41.44',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 39.46 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 41.44",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 39.46"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 1.98"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 41.44"
                        ),
                        _appVariables.pendingGetX.value = "3",
                        _appVariables.orderGetX.value = "12",
                        PrefUtils.getPending(
                            pending: _appVariables.pendingGetX
                                .value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables.orderGetX.value
                        ),
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
                        itemCount: vip1List3.length,
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
                                    Text(vip1List3[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List3[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List3[index]["price"]}",
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
                                    "assets/images/${vip1List3[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '4'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
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
                      'Order total amount: \$ 109.35',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 5.46',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 114.81',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 109.35 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 114.81",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 109.35"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 5.46"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 114.81"
                        ),
                        _appVariables.pendingGetX.value = "4",
                        _appVariables.orderGetX.value = "11",
                        PrefUtils.getPending(
                            pending: _appVariables.pendingGetX
                                .value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables.orderGetX
                                .value
                        ),
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
                        itemCount: vip1List4.length,
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
                                    Text(vip1List4[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List4[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List4[index]["price"]}",
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
                                    "assets/images/${vip1List4[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '5'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
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
                      'Order total amount: \$ 152.85',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 7.64‬',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 160.49',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 152.85 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 160.49",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 152.85"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 7.64"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 160.49"
                        ),
                        _appVariables.pendingGetX.value =
                        "5",
                        _appVariables.orderGetX.value =
                        "10",
                        PrefUtils.getPending(
                            pending: _appVariables
                                .pendingGetX.value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables.orderGetX
                                .value
                        ),
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
                        itemCount: vip1List5.length,
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
                                    Text(vip1List5[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List5[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List5[index]["price"]}",
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
                                    "assets/images/${vip1List5[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '6'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
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
                      'Order total amount: \$ 157.39',
                      style:
                      TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 17.86',
                      style:
                      TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 175.25',
                      style:
                      TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 157.39 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 175.25",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 157.39"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 17.86"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 175.25"
                        ),
                        _appVariables.pendingGetX
                            .value = "6",
                        _appVariables.orderGetX
                            .value = "9",
                        PrefUtils.getPending(
                            pending: _appVariables
                                .pendingGetX.value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables
                                .orderGetX.value
                        ),
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
                        itemCount: vip1List6.length,
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
                                    Text(vip1List6[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List6[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List6[index]["price"]}",
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
                                    "assets/images/${vip1List6[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '7'
            ? SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
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
                      'Order total amount: \$ 174.85',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 15.75',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 190.6',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 174.85 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 190.6",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 174.85"
                        ),
                        PrefUtils.getCommission(
                            commission: "\$ 15.75"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 190.6"
                        ),
                        _appVariables.pendingGetX
                            .value = "7",
                        _appVariables.orderGetX
                            .value = "8",
                        PrefUtils.getPending(
                            pending: _appVariables
                                .pendingGetX.value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables
                                .orderGetX.value
                        ),
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
                        itemCount: vip1List7.length,
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
                                    Text(vip1List7[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List7[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List7[index]["price"]}",
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
                                    "assets/images/${vip1List7[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '8'
            ? SingleChildScrollView(
          physics:
          const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: 500,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    const Text(
                      'Order total amount: \$ 546.2',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 29.3‬',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 575.5',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 546.2 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 575.5",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils.getTotal(
                            total: "\$ 546.2"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 29.3"
                        ),
                        PrefUtils.getExpected(
                            expected: "\$ 575.5"
                        ),
                        _appVariables
                            .pendingGetX
                            .value = "8",
                        _appVariables
                            .orderGetX.value =
                        "7",
                        PrefUtils.getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils.getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
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
                        itemCount: vip1List8.length,
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
                                    Text(vip1List8[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List8[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List8[index]["price"]}",
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
                                    "assets/images/${vip1List8[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '9'
            ? SingleChildScrollView(
          // physics:
          //     const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: 500,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    const Text(
                      'Order total amount: \$ 468.8',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 23.4',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 492.2',
                      style: TextStyle(
                          fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 468.8 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 492.2",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils
                            .getTotal(
                            total: "\$ 468.8"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 23.4"
                        ),
                        PrefUtils
                            .getExpected(
                            expected: "\$ 492.2"
                        ),
                        _appVariables
                            .pendingGetX
                            .value = "9",
                        _appVariables
                            .orderGetX
                            .value = "6",
                        PrefUtils
                            .getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils
                            .getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
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
                        itemCount: vip1List9.length,
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
                                    Text(vip1List9[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List9[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List9[index]["price"]}",
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
                                    "assets/images/${vip1List9[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '10'
            ? SingleChildScrollView(
          // physics:
          //     const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: 500,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    const Text(
                      'Order total amount: \$ 831.75',
                      style: TextStyle(
                          fontSize:
                          20),
                    ),
                    const Text(
                      'Commission: \$ 100.45‬',
                      style: TextStyle(
                          fontSize:
                          20),
                    ),
                    const Text(
                      'Expected return: \$ 932.2',
                      style: TextStyle(
                          fontSize:
                          20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 831.75 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 831.75",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils
                            .getTotal(
                            total: "\$ 831.75"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 100.45"
                        ),
                        PrefUtils
                            .getExpected(
                            expected: "\$ 932.2"
                        ),
                        _appVariables
                            .pendingGetX
                            .value =
                        "10",
                        _appVariables
                            .orderGetX
                            .value =
                        "5",
                        PrefUtils
                            .getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils
                            .getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
                        Get.to(
                            Wallet()),
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
                        itemCount: vip1List10.length,
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
                                    Text(vip1List10[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List10[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List10[index]["price"]}",
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
                                    "assets/images/${vip1List10[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text == '11'
            ? SingleChildScrollView(
          // physics:
          //     const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: 500,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    const Text(
                      'Order total amount: \$ 1295.55',
                      style: TextStyle(
                          fontSize:
                          20),
                    ),
                    const Text(
                      'Commission: \$ 187.7‬',
                      style: TextStyle(
                          fontSize:
                          20),
                    ),
                    const Text(
                      'Expected return: \$ 1483.25‬',
                      style: TextStyle(
                          fontSize:
                          20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 1295.55 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 1295.55",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils
                            .getTotal(
                            total: "\$ 1295.55"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 187.7"
                        ),
                        PrefUtils
                            .getExpected(
                            expected: "\$ 1483.25‬"
                        ),
                        _appVariables
                            .pendingGetX
                            .value =
                        "11",
                        _appVariables
                            .orderGetX
                            .value =
                        "4",
                        PrefUtils
                            .getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils
                            .getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
                        Get.to(
                            Wallet()),
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
                        itemCount: vip1List11.length,
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
                                    Text(vip1List11[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List11[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List11[index]["price"]}",
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
                                    "assets/images/${vip1List11[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller.text ==
            '12'
            ? SingleChildScrollView(
          // physics:
          //     const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                // height: 500,
                child:
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  children: [
                    const Text(
                      'Order total amount: \$ 2,682',
                      style:
                      TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Commission: \$ 184.1‬',
                      style:
                      TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Expected return: \$ 2,866.1',
                      style:
                      TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Your amount: " + '${amount}',
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 2682 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 2,866.1",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils
                            .getTotal(
                            total: "\$ 2,682"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 184.1"
                        ),
                        PrefUtils
                            .getExpected(
                            expected: "\$ 2,866.1"
                        ),
                        _appVariables
                            .pendingGetX
                            .value =
                        "12",
                        _appVariables
                            .orderGetX
                            .value =
                        "3",
                        PrefUtils
                            .getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils
                            .getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
                        Get
                            .to(
                            Wallet()),
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
                        itemCount: vip1List12.length,
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
                                    Text(vip1List12[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List12[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List12[index]["price"]}",
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
                                    "assets/images/${vip1List12[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller
            .text ==
            '13'
            ? SingleChildScrollView(
          // physics:
          //     const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                //   height:
                // 500,
                child:
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
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
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 1500 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 1,575",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
                        snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils
                            .getTotal(
                            total: "\$ 1,500"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 75"
                        ),
                        PrefUtils
                            .getExpected(
                            expected: "\$ 1,575"
                        ),
                        _appVariables
                            .pendingGetX
                            .value =
                        "2",
                        _appVariables
                            .orderGetX
                            .value =
                        "13",
                        PrefUtils
                            .getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils
                            .getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
                        Get
                            .to(
                            Wallet()),
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
                        itemCount: vip1List13.length,
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
                                    Text(vip1List13[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List13[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List13[index]["price"]}",
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
                                    "assets/images/${vip1List13[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller
            .text ==
            '14'
            ? SingleChildScrollView(
          // physics:
          //     const NeverScrollableScrollPhysics(),
          child:
          Column(
            children: [
              Container(
                //   height:
                // 500,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 2082 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 2,420.5",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
                        snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils
                            .getTotal(
                            total: "\$ 2082"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 338.5"
                        ),
                        PrefUtils
                            .getExpected(
                            expected: "\$ 2,420.5"
                        ),
                        _appVariables
                            .pendingGetX
                            .value =
                        "14",
                        _appVariables
                            .orderGetX
                            .value =
                        "1",
                        PrefUtils
                            .getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils
                            .getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
                        Get
                            .to(
                            Wallet()),
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
                        itemCount: vip1List14.length,
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
                                    Text(vip1List14[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List14[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List14[index]["price"]}",
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
                                    "assets/images/${vip1List14[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
            : _Vip1Controller
            .text ==
            '15'
            ? SingleChildScrollView(
          // physics:
          //     const NeverScrollableScrollPhysics(),
          child:
          Column(
            children: [
              Container(
                // height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: TextStyle(fontSize: 20),
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
                      amount.toDouble() <= 2924.25 ?

                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.info,
                          text:
                          "Your amount is less than the requirements, you must make deposit.Your amount  is : \$ 3,184.65",
                          onConfirmBtnTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Packages()));
                          }) : {
                        snackBar = const SnackBar(content: Text("Success",style: TextStyle(color: Colors.green),),),
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar),
                        PrefUtils
                            .getTotal(
                            total: "\$ 2,924.25"
                        ),
                        PrefUtils
                            .getCommission(
                            commission: "\$ 345.7‬"
                        ),
                        PrefUtils
                            .getExpected(
                            expected: "\$ 3,184.65"
                        ),
                        _appVariables
                            .pendingGetX
                            .value =
                        "15",
                        _appVariables
                            .orderGetX
                            .value =
                        "0",
                        PrefUtils
                            .getPending(
                            pending: _appVariables
                                .pendingGetX
                                .value
                        ),
                        PrefUtils
                            .getOrders(
                            order: _appVariables
                                .orderGetX
                                .value
                        ),
                        Get
                            .to(
                            Wallet()),
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
                        itemCount: vip1List15.length,
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
                                    Text(vip1List15[index]['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black)),
                                    Text(
                                      vip1List15[index]["brand"].toString(),
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${vip1List15[index]["price"]}",
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
                                    "assets/images/${vip1List15[index]["image"]}",
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
                  children: const[
                    SizedBox(height: 10,),
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
      _Vip1Controller.text = user.vip1.toString();
    });

    amount = user.amount;

    print("vip1vip1vip1vip1");
    print(Vip1);
    return user;
  }
}
