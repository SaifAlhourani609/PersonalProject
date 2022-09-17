// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables
import 'package:wealth_earn/config/prefs/pref_utils.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wealth_earn/screens/account_screen.dart';
import 'package:wealth_earn/screens/customers_screen.dart';
import 'package:wealth_earn/model/user_data_model.dart';
import 'package:wealth_earn/screens/products_screen.dart';
import 'package:wealth_earn/screens/recharge_screen.dart';
import 'package:wealth_earn/screens/packages_screeen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wealth_earn/string/app_variable.dart';
import 'package:wealth_earn/widgets/marquee.dart';

enum SpecialContainerType { customers, products, recharge, order }
enum BottomNav { home, profile, Packages }

final AppVariables _appVariables = Get.put(AppVariables());

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

final auth = FirebaseAuth.instance;
var collection = FirebaseFirestore.instance.collection('users');

var bpm;

final TextEditingController _idController = TextEditingController();

class _WalletState extends State<Wallet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readFirebaseData();
    _getRecord();
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[
        Color.fromRGBO(4, 9, 35, 1),
        const Color.fromRGBO(39, 105, 171, 1)
      ],
    ).createShader(const Rect.fromLTWH(110.0, 500.0, 200.0, 70.0));

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1a1830),
        body:
        Column(
          children: <Widget>[
            Container(
              height: height * 0.41,
              // margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffb43af7),
                    Color(0xff6d2af7),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              child: Center(
                            child: WidgetCircularAnimator(
                              size: 50,
                              innerIconsSize: 2,
                              outerIconsSize: 2,
                              innerAnimation: Curves.easeInOutBack,
                              outerAnimation: Curves.easeInOutBack,
                              innerColor: Colors.deepPurple,
                              outerColor: Color(0xff6d2af7),
                              innerAnimationSeconds: 10,
                              outerAnimationSeconds: 10,
                              child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200]),
                                  child: Image.asset(
                                      'assets/welcome_screen/person.png')),
                            ),
                          )),

                          Text('Wealth\nE a r n',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                // color: Colors.white,
                                foreground: Paint()..shader = linearGradient,

                                fontSize: 25,
                                fontFamily: 'Nisebuschgardens',
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsPage()));
                            },
                            child: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      const Text(
                        'Account ID',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: GestureDetector(
                        onTap: () {
                          var snackBar;
                          snackBar =
                              const SnackBar(content: const Text('copied'));
                          FlutterClipboard.copy(_idController.text).then(
                              (value) => ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar));
                        },
                        child: TextField(
                          controller: _idController,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none)),
                            enabled: false,
                            suffixIcon: Icon(
                              Icons.copy,
                              color: Colors.white,
                            ),
                            isDense: true,
                          ),
                          readOnly: false,
                        ),
                      )),
                      Container(
                        height: height * 0.16,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black12,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double innerHeight = constraints.maxHeight;
                            double innerWidth = constraints.maxWidth;
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: innerHeight * 0.2,
                                    width: innerWidth,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.black12,
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.all(width*0.005),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              FutureBuilder<MyUser>(
                                                future: _getRecord(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<MyUser>
                                                        snapshot) {
                                                  if (snapshot.hasError) {
                                                    return const Text(
                                                        "");
                                                  }
                                                  if (!snapshot.hasData) {
                                                    return const Text(
                                                        "");
                                                  }
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    MyUser user =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("${user.name}",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        25,
                                                                    color: Colors
                                                                        .white)),
                                                      ],
                                                    );
                                                  }
                                                  return const Text("wait..",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                 SizedBox(
                                                  width: width*0.28,
                                                ),
                                                Text(
                                                  'Orders',
                                                  style: TextStyle(
                                                    color: Colors.grey[200],
                                                    fontFamily: 'Nunito',
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  _appVariables.orderGetX.value,
                                                  style: const TextStyle(
                                                      color: Colors.blue,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 15,
                                              ),
                                              child: Container(
                                                height: 50,
                                                width: 2,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Pending',
                                                  style: TextStyle(
                                                    color: Colors.grey[200],
                                                    fontFamily: 'Nunito',
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  _appVariables.pendingGetX.value,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontFamily: 'Nunito',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 15,
                                              ),
                                              child: Container(
                                                height: 50,
                                                width: 2,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  'Total Amount',
                                                  style: TextStyle(
                                                    color: Colors.grey[200],
                                                    fontFamily: 'Nunito',
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                FutureBuilder<MyUser>(
                                                  future: _getRecord(),
                                                  builder:
                                                      (BuildContext context,
                                                          AsyncSnapshot<MyUser>
                                                              snapshot) {
                                                    if (snapshot.hasError) {
                                                      return const Text(
                                                          "");
                                                    }
                                                    if (!snapshot.hasData) {
                                                      return const Text(
                                                          "");
                                                    }
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                      MyUser user =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "\$ ${user.amount}",
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .green,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          GestureDetector(
                                                              onTap: () {
                                                                setState(() {});
                                                              },
                                                              child: const Icon(
                                                                Icons
                                                                    .refresh_outlined,
                                                                color: Colors
                                                                    .green,
                                                                size: 15,
                                                              )),
                                                        ],
                                                      );
                                                    }
                                                    return const Text(
                                                        "Refresh..",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white));
                                                  },
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SizedBox(height: 22, child: MarqueeTextPage(text: '${bpm}')),
                ],
              ),
            ),

            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: const <Widget>[
                    SpecialContainer(SpecialContainerType.customers),
                    SpecialContainer(SpecialContainerType.products),
                    SpecialContainer(SpecialContainerType.recharge),
                    SpecialContainer(SpecialContainerType.order),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _readFirebaseData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("model001");
    var data = await ref.get(); // get init data
    if (data.exists) {
      Map<dynamic, dynamic> myData = data.value as Map<dynamic, dynamic>;
    } else {}
    ref.onValue.listen((event) {
      _fillData(event.snapshot.value as Map<dynamic, dynamic>);
    });
  }

  void _fillData(Map<dynamic, dynamic> myData) {
    if (myData['BPM'] != null) bpm = myData['BPM'];
    if (mounted) setState(() {});
  }

  var vip1;
  var total;
  var commission;
  var expected;
  var pending;
  var order;

  Future<MyUser> _getRecord() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _appVariables.emailGetX.value = preferences.getString("email")!;
    _appVariables.pendingGetX.value = preferences.getString("pending")!;
    _appVariables.orderGetX.value = preferences.getString("order")!;

    var future = await collection
        .where('email', isEqualTo: _appVariables.emailGetX.value)
        .get();
    var docs = future.docs;
    print(docs.first.data());
    MyUser user = MyUser.fromJson(docs.first.data());

    _idController.text = user.id.toString();
    vip1 = user.vip1;

    print("order");
    print(_appVariables.orderGetX.value);
    print(_appVariables.pendingGetX.value);

    return user;
  }
}

class SpecialContainer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final type;

  const SpecialContainer(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? containerText, containerImage;
    Color? color;
    ButtonStyleButton? button;

    switch (type) {
      case SpecialContainerType.customers:
        containerText = "Customers";
        containerImage = "assets/people.png";
        color = Colors.blue;
        button = ElevatedButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.white,
                )
              ]),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Customers()));
          },
        );

        break;
      case SpecialContainerType.products:
        containerText = "Products";
        containerImage = "assets/box.png";
        color = Colors.orange;
        button = ElevatedButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.white,
                )
              ]),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Products()));
          },
        );
        break;
      case SpecialContainerType.recharge:
        containerText = "Recharge";
        containerImage = "assets/recharge.png";
        color = Colors.green;
        button = ElevatedButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.white,
                )
              ]),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Recharge()));
          },
        );
        break;
      case SpecialContainerType.order:
        containerText = "Order";
        containerImage = "assets/order.png";
        color = Colors.redAccent;
        button = ElevatedButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Colors.white,
                )
              ]),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Packages()));
          },
        );
        break;
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white24,
                    offset: Offset(0, 5),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: CircleAvatar(
                // backgroundImage: AssetImage(containerImage,),
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 31,
                  height: 31,
                  child: Image.asset(
                    containerImage!,
                  ),
                ),
                backgroundColor: color,
                radius: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  containerText!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: button),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
