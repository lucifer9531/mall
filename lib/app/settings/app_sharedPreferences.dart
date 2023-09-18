import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static setCache(String key, String value) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString(key, jsonEncode(value));
  }

  static getCache(String key) async {
    try {
      var sp = await SharedPreferences.getInstance();
      String? s = sp.getString(key);
      if (s != null) {
        return json.decode(s);
      } else {
        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }

  static removeCache(String key) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static clearAllCache() async {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}