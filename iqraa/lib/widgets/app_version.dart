import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion extends StatefulWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  State<AppVersion> createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  String _version = "";

  void _getAppVersion() async {
    PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _version = _packageInfo.version;
      });
    }
  }

  @override
  void initState() {
    _getAppVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Iqra'a",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.018),
          ),
          Text(
            // "Version: $_version\n",
            "Version: 1.0.0",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
