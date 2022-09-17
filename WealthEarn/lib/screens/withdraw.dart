import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:wealth_earn/auth/login_screen.dart';
import 'package:wealth_earn/home_page_wallet_screen.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  final formKey = GlobalKey<FormState>();
  List<String> myList = ['BEP20', 'BEP2', 'TRC20', 'ERC20'];

  // ignore: prefer_typing_uninitialized_variables
  var selected;

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
                        top: 0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Color(0xff1F2630),
                              width: 5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          color: Color(0xff1F2630)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 40, top: 15, bottom: 1),
                            child: Text(
                              'Make sure to enter the right address',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 15, right: 15),
                              child: Column(children: [
                                const Text(
                                  'Address',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.solid,
                                                  width: 2),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          hintText: 'Enter your wallet address',
                                          hintStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11),
                                          errorStyle:
                                              TextStyle(color: Colors.white),
                                          prefixIcon: Icon(Icons.person,
                                              color: Colors.grey)),
                                      style: TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                      textInputAction: TextInputAction.next,
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value!.isEmpty || value == null) {
                                          return 'Please enter your wallet address';
                                        }
                                      },
                                    ),
                                    const Divider(),
                                    const SizedBox(height: 15),
                                    const Text(
                                      'Network',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                          errorStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  style: BorderStyle.solid,
                                                  width: 2),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25)))),
                                      hint: const Text(
                                        'Ensure the network matches the withdrawal address',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                        ),
                                      ),
                                      dropdownColor: const Color(0xff1F2630),
                                      iconEnabledColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      value: selected,
                                      items: myList.map((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ));
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selected = value;
                                        });
                                      },
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value == null) {
                                          return "Please Enter The Right Network";
                                        }
                                      },
                                    ),
                                    const Divider(),
                                    const SizedBox(height: 15),
                                    const Text(
                                      'Amount',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: const BorderSide(
                                                style: BorderStyle.solid,
                                                width: 2),
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.send_to_mobile,
                                            color: Colors.grey,
                                          ),
                                          hintText: 'USDT',
                                          hintStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18)),
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value!.isEmpty || value == null) {
                                          return 'Please Enter The Correct Amount';
                                        }
                                      },
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ]),
                                ),
                                const SizedBox(height: 15),

                                // ignore: deprecated_member_use
                                OutlineButton(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      CoolAlert.show(
                                          context: context,
                                          type: CoolAlertType.loading,
                                          text:
                                              "Please wait for your transaction to be confirmed",
                                          onConfirmBtnTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Wallet()));
                                          });
                                    }
                                  },
                                  child: const Text("SEND",
                                      style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 2.2,
                                          color: Colors.green)),
                                ),
                              ]))
                        ],
                      ))
                ]),
              ))
            ])));
  }
}
