import 'dart:convert';

import 'package:bloc_demo/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
   static final _instance = PreferenceManager._internal();

  PreferenceManager._internal();

  static PreferenceManager get instance => _instance;

  Future<bool> setLogin(bool loginType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('login', loginType);
  }

  Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('login')) {
      var accountType = await prefs.getBool('login');
      return accountType!;
    } else
      return false;
  }

  Future<bool> setUserOnDevice(User account) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (account != null) {
      // await storage.deleteAll();
      // await storage.write(key: "stoken", value: account.Token.toString());
      // account.Token="s";
      final userJson = jsonEncode(account.toJson());
      return await prefs.setString('user', userJson);
    } else {
      return await prefs.remove("user");
    }
  }

  Future<User?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      Map<String, dynamic> map = jsonDecode(prefs.getString('user')!);
      var data = User.fromJson(map);

      /* String? value = await storage.read(key: "stoken");

      if(value!=null) {
        data.Token = value;
      }*/
      return data;
    } else
      return null;
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove("login");
    await prefs.remove("user");
    // await storage.deleteAll();
  }
}
