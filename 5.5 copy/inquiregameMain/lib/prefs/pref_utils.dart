import 'package:inquiregame/prefs/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  PrefUtils();

  /// State Audio.
  static caseAudio(bool isplaying ,bool audioplayed ,int result) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool(PrefKeys.isplaying, isplaying );
    await preferences.setBool(PrefKeys.audioplayed, audioplayed );
    await preferences.setInt(PrefKeys.result, result );

  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.token) ?? "";
  }

  static setIsLoggedIn(bool isLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(PrefKeys.isLoggedIn, isLoggedIn);
  }

  static Future<bool> getIsLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  static setUser(String userData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.user, userData);
  }

  static clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  // Profile.
  static profileData(String name,String email ,String phone, String vat, String lang, String image_512) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString("name", name);
    await preferences.setString("email", email);
    await preferences.setString("phone", phone);
    await preferences.setString("vat", vat);
    await preferences.setString("lang", lang);
    await preferences.setString("image_512", image_512);
    // await preferences.setString("sale_order_count", sale_order_count);
  }

}
