import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // لاستيراد SharedPreferences
import 'package:habit_tracker/theme/dark.dart';
import 'package:habit_tracker/theme/light.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = light; // يبدأ بالتيم الفاتح افتراضيًا
  ThemeData get themedata => _themeData;
  bool get isdarkmode => _themeData == dark;

  Themeprovider() {
    _loadTheme(); // تحميل الثيم عند تهيئة Themeprovider
  }

  // تعيين الثيم
  set themedata(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // التبديل بين الثيمات وحفظ الحالة في SharedPreferences
  void toggletheme() async {
    if (_themeData == light) {
      themedata = dark;
    } else {
      themedata = light;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isDarkMode', isdarkmode); // حفظ حالة الثيم في SharedPreferences
  }

  // تحميل حالة الثيم من SharedPreferences عند بدء التطبيق
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ??
        false; // الحصول على الثيم المحفوظ أو الثيم الفاتح افتراضيًا
    themedata =
        isDarkMode ? dark : light; // تعيين الثيم بناءً على القيمة المحفوظة
  }
}
