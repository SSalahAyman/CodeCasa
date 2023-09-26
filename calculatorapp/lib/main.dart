import 'package:calculatorapp/screens/main_screen.dart';
import 'package:calculatorapp/theme/application_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('themeBox');
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
