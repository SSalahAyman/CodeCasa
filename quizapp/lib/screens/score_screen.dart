import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/controllers/quiz_controller.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen({super.key});

  late double width;
  late double height;

  final btnPrimaryGradient = const LinearGradient(
    colors: [Color(0xff7956f0), Color(0xff5e43bb), Color(0xFF47338e)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff1f1147),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: GetBuilder<QuizController>(
            init: Get.find<QuizController>(),
            builder: (controller) => Column(
              children: [
                SizedBox(
                  height: height * 0.07,
                ),
                const Text(
                  "Results ",
                  style: TextStyle(
                      color: Color(0xff37e9bb),
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: width * 0.451, bottom: height * 0.014),
                  child: const Text(
                    "Total correct answers",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: Text(
                        controller.countOfCorrectAnswers.toString(),
                        style: const TextStyle(
                            color: Color(0xff37e9bb),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.012,
                    ),
                    const Text(
                      "out of 7 Questions",
                      style: TextStyle(
                          color: Color(0xff37e9bb),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: btnPrimaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: width,
                    height: height * 0.45,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.35, left: width * 0.2),
                          child: Column(
                            children: [
                              Text(
                                "Congratulations",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.07,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.007,
                              ),
                              Text(
                                controller.name,
                                style: TextStyle(
                                    color: const Color(0xfff5c44a),
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.12, top: height * 0.04),
                          child: Text(
                            "Your final score is ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.08,
                            ),
                          ),
                        ),
                        Lottie.asset(
                            "assets/animated_icons/score_screen_icon.json",
                            width: width * 1),
                        Center(
                          child: CircleAvatar(
                            radius: width * 0.2,
                            backgroundColor: const Color(0xfff5c44a),
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Text(
                                '${controller.scoreResult.round()}/100',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.09,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
