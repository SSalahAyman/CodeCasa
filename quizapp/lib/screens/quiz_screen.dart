import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/components/quiz_screen/progress_timer.dart';
import 'package:quizapp/controllers/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static late double width;
  static late double height;

  static const routeName = '/quiz_screen';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff1f1147),
      body: Container(
          width: width,
          height: height,
          child: GetBuilder<QuizController>(
            init: QuizController(),
            builder: (controller) => Column(
              children: [
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Question 1 /10",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Color.fromARGB(238, 6, 255, 213),
                          ),
                        ),
                      ),
                      width: width * 0.53,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          color: Color(0xff32177d),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    ProgressTimer(),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
