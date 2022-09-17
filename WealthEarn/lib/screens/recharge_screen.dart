// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class Recharge extends StatefulWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  State<Recharge> createState() => _RechargeState();
}

class _RechargeState extends State<Recharge> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _codeController2 = TextEditingController();

  BuildContext? scaffoldContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _codeController.text = 'TAH9DCpHacRiwvo2HdHePhHmjMTbq3XpBp';
    _codeController2.text = 'Tron (TRC20)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff1a1830),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://cdn.coingape.com/wp-content/uploads/2021/08/09183707/images-1-18-.jpg"))),
                  ),
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                  child: SingleChildScrollView(
                child: Column(children: [
                  const Padding(
                      padding: EdgeInsets.only(
                    top: 150,
                    bottom: 50,
                  )),
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: const Color(0xff1F2630),
                            width: 5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        color: const Color(0xff1F2630)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Payment Method',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Image.asset('assets/QrCode.png'),
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        const Text('scan the Qr code',
                            textAlign: TextAlign.center,
                            style:  TextStyle(color:  Color(0xff7D8592))),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          'Send only USDT to this deposit address.'
                          'Sending coin or token other than USDT to this address may result in the loss of your deposit.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xff7D8592)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        const Text(
                          'make sure to Copy the same Address.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Deposit Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xff7D8592)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        GestureDetector(
                          onTap: () {
                            var snackBar;
                            snackBar = const SnackBar(content:  Text('copied'));
                            FlutterClipboard.copy(_codeController.text).then(
                                (value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar));
                          },
                          child: TextField(
                            controller: _codeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              enabled: false,
                              suffixIcon: Icon(
                                Icons.copy,
                                color: Colors.white,
                              ),
                              isDense: true,
                            ),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                            readOnly: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Network Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xff7D8592)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            var snackBar;
                            snackBar = const SnackBar(content: Text('copied'));
                            FlutterClipboard.copy(_codeController2.text).then(
                                (value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar));
                          },
                          child: TextField(
                            controller: _codeController2,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              enabled: false,
                              suffixIcon: Icon(
                                Icons.copy,
                                color: Colors.white,
                              ),
                              isDense: true,
                            ),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                            readOnly: false,
                          ),
                        ),

                        // ignore: deprecated_member_use
                        OutlineButton(
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            CoolAlert.show(
                              backgroundColor: const Color(0xff7D8592),
                              context: context,
                              type: CoolAlertType.loading,
                              text:
                                  "Please wait for your transaction to be processed",
                            );
                          },
                          child: const Text("SUBMIT",
                              style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2.2,
                                  color: Colors.green)),
                        ),
                      ],
                    ),
                  )
                ]),
              ))
            ])));
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
