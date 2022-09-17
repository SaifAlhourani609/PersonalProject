import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyAndSecurity extends StatefulWidget {
  const PrivacyAndSecurity({Key? key}) : super(key: key);

  @override
  _PrivacyAndSecurityState createState() => _PrivacyAndSecurityState();
}

bool isActive1 = true;
bool isActive2 = true;
bool isActive3 = true;
bool isActive4 = true;
bool isActive5 = true;
bool isActive6 = true;
bool isActive7 = true;
bool isActive8 = true;
bool isActive9 = true;

class _PrivacyAndSecurityState extends State<PrivacyAndSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff1F2630),
      appBar: AppBar(
        backgroundColor: Color(0xff1F2630),
        title: const Text('Privacy and security'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Security',
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enable security and malware protection',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                         color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive1,
                      onChanged: (value) {
                        isActive1 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prediction server to help you complete orders',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive2,
                      onChanged: (value) {
                        isActive2 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prefetch resources to load pages more quickly',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive3,
                      onChanged: (value) {
                        isActive3 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Automatically send usage statistics and rewords',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive4,
                      onChanged: (value) {
                        isActive4 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2-Step Verification',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive5,
                      onChanged: (value) {
                        isActive5 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'report an error without asking me for permission',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive6,
                      onChanged: (value) {
                        isActive6 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Allow users to change Internet password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive7,
                      onChanged: (value) {
                        isActive7 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),     Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Custom warning message',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive8,
                      onChanged: (value) {
                        isActive8 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Configuring custom password policies',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: isActive9,
                      onChanged: (value) {
                        isActive9 = value;
                        setState(() {});
                      },
                      activeColor: CupertinoColors.activeGreen,
                      trackColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
