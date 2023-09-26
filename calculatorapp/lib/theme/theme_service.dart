import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

/**
 * this class contains the logic of light and dark theme 
 */
class ThemeServiceController extends GetxController {
  final Box _themeBox = Hive.box('themeBox');
  final _themeKey = 'isDarkMode';

  void saveThemeToBox(bool isDarkMode) {
    _themeBox.put(_themeKey, isDarkMode);
  }

  bool loadThemeFromBox() {
    return _themeBox.get(_themeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeToBox(!loadThemeFromBox());
  }
}
