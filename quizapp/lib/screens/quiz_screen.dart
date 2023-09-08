import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Question ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          controller.numberOfQuestion.round().toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "/",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          controller.countOfQuestion.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                    width: width * 0.53,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: Color(0xff32177d),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  ProgressTimer(),
                ],
              ),
              SizedBox(
                height: height * 0.00,
              ),
              Lottie.asset("assets/animated_icons/quiz_screen_icon.json",
                  width: width * 0.4),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Container(
                    width: width,
                    height: height * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04, top: height * 0.02),
                      child: Text(
                        "Flutter is an open-source UI software development kit created by salahaydadasdman ______",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Color(0xFF101010),
                            ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
