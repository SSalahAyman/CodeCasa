import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/screens/intro_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuizApp",
      home: IntroScreen(),
    );
  }
}
