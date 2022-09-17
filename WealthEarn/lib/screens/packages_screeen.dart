// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wealth_earn/model/user_data_model.dart';
import 'package:wealth_earn/screens/account_screen.dart';
import 'package:wealth_earn/screens/count_down_timer.dart';
import 'package:wealth_earn/screens/vip1Screen.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';
import 'package:wealth_earn/screens/vip2Screen.dart';
import 'package:wealth_earn/screens/vip3Screen.dart';
import 'package:wealth_earn/string/app_variable.dart';
enum BottomNav { home, profile }

class Packages extends StatefulWidget {
  Packages({Key? key}) : super(key: key);

  @override
  _PackagesState createState() => _PackagesState();
}

final AppVariables _appVariables = Get.put(AppVariables());

final auth = FirebaseAuth.instance;
// var collection = FirebaseFirestore.instance.collection('users');

final TextEditingController _amountController = TextEditingController();

class _PackagesState extends State<Packages> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xff1a1830),
      appBar: AppBar(
        backgroundColor:  const Color(0xff1a1830),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) =>  Wallet(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration:  const Duration(milliseconds: 200),
              ),
            );
          },
          icon:  const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Membership Packages',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,color: Colors.white
                  ),
                ),
                Padding(
                  padding:  const EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    'Choose a membership plan to unlock the features',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      // textStyle:  TextStyle(color: Colors.white,),
                        fontSize: 14,color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                    padding:  const EdgeInsets.only(top: 0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'VIP 1 ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,color:  const Color(0xffE5C150),fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Commission %5',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,color: Colors.white
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'VIP 2 ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(

                                  fontSize: 14,color:  const Color(0xffE5C150),fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Commission %7',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,color: Colors.white
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'VIP 3 ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,color:  const Color(0xffE5C150),fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Commission %12',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // amount <= 1000 ?
                        1111 <= 1000 ?
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.info,
                            text:
                            "To fulfill the conditions, you must make a deposit.",
                            onConfirmBtnTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Wallet()));
                            }) :
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountDownTimer(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          height: 147,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 8,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image:  const DecorationImage(
                                      image: AssetImage('assets/vip1.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                width: 18,
                                bottom: 0,
                                child: Center(
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Radio(
                                      activeColor: Colors.green,
                                      overlayColor:
                                      MaterialStateProperty.all(Colors.red),
                                      value: 1,
                                      groupValue: 1,
                                      onChanged: (int? value) {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {
                        amount <= 5000 ?
                        // 1111 <= 1000 ?
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.info,
                            text:
                            "To fulfill the conditions, you must make a deposit.",
                            onConfirmBtnTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Wallet()));
                            }):
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Vip2()
                          ),
                        );
                      },
                      child: Padding(
                        padding:   const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          height: 147,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 8,
                                top: 0,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image:   const DecorationImage(
                                        image:  AssetImage('assets/vip2.png'),

                                        fit: BoxFit.fill,
                                      ),
                                    )),
                              ),
                              Positioned(
                                width: 18,
                                bottom: 0,
                                child: Center(
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Radio(
                                      activeColor:  const Color(0xffF6931E),
                                      overlayColor:
                                      MaterialStateProperty.all(Colors.red),
                                      value: 1,
                                      groupValue: 1,
                                      onChanged: (int? value) {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {
                        amount <= 7000 ?
                        // 1111 <= 1000 ?
                        CoolAlert.show(
                            context: context,
                            type: CoolAlertType.info,
                            text:
                            "To fulfill the conditions, you must make a deposit.",
                            onConfirmBtnTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Wallet()));
                            }) :
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Vip3(),
                          ),
                        );
                      },
                      child: Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SizedBox(
                          height: 147,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 8,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image:  const DecorationImage(
                                      image: const AssetImage('assets/vip3.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                width: 18,
                                bottom: 0,
                                child: Center(
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Radio(
                                      activeColor:  const Color(0xffD8AFD1),
                                      overlayColor:
                                      MaterialStateProperty.all(Colors.red),
                                      value: 1,
                                      groupValue: 1,
                                      onChanged: (int? value) {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var amount;

  Future<MyUser> _getRecord() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _appVariables.emailGetX.value = preferences.getString("email")!;

    var future = await collection
        .where('email', isEqualTo: _appVariables.emailGetX.value)
        .get();
    var docs = future.docs;
    print(docs.first.data());
    MyUser user = MyUser.fromJson(docs.first.data());

    amount = user.amount;

    return user;
  }

}