import 'package:shared_preferences/shared_preferences.dart';
import 'package:wealth_earn/config/prefs/pref_keys.dart';

class PrefUtils {
  PrefUtils();

  static setIsLoggedIn(bool isLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(PrefKeys.isLoggedIn, isLoggedIn);
  }

  static Future<bool> getIsLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  static getEmail({String? email,}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("email", email! );
  }

  static getTotal({String? total}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.total, total! );
  }

  static getCommission({String? commission}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.commission, commission! );
  }

  static getExpected({String? expected}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.expected, expected! );
  }

  static getOrders({String? order}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.order, order! );
  }

  static getPending({String? pending}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.pending, pending! );
  }

  static clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

}
