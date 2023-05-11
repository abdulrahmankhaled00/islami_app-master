import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appconfigprovider extends ChangeNotifier {
  String languge = 'ar';
  ThemeMode apptheme = ThemeMode.light;

  void changlanguge(String x) async {
    if (languge == x) {
      return;
    } else {
      languge = x;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', languge);
    notifyListeners();
  }

  void changtheme(ThemeMode mode) async {
    if (apptheme == mode) {
      return;
    } else {
      apptheme = mode;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', apptheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  bool darkmode() {
    return apptheme == ThemeMode.dark;
  }
}
