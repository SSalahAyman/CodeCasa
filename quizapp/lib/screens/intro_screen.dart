import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/screens/welcome_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  late double width;
  late double height;

  static const routeName = '/intro_screen';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/backgrounds/intro_screen.jpg"),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.44,
              child: Lottie.asset(
                "assets/animated_icons/intro_icon.json",
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Welcome to',
                  textStyle: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff37e9bb),
                  ),
                ),
                WavyAnimatedText(
                  'Quizzy Quiz',
                  textStyle: const TextStyle(
                      fontSize: 32,
                      color: Color(0xff37e9bb),
                      fontWeight: FontWeight.w600),
                ),
              ],
              isRepeatingAnimation: true,
            ),
            SizedBox(
              height: height * 0.08,
            ),
            const Text(
              "Let's play!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.1),
              child: const Text(
                "Play now and gain highest score",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0)),
                fixedSize: Size(width * 0.65, height * 0.06),
                backgroundColor: const Color(0xff6949fe),
              ),
              onPressed: () {
                Get.to(WelcomeScreen());
              },
              child: const Text(
                "Play Now",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
