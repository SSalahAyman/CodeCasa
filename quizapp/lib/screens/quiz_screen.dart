import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizapp/components/quiz_screen/progress_timer.dart';
import 'package:quizapp/components/quiz_screen/question_card.dart';
import 'package:quizapp/controllers/quiz_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static late double width;
  static late double height;

  static const routeName = '/quiz_screen';

  final btnPrimaryGradient = const LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

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
                  /**
                   * Active & count of questions
                   */
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
                      ),
                    ),
                    width: width * 0.53,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: const Color(0xff32177d),
                        borderRadius: BorderRadius.circular(20)),
                  ),

                  /**
                   * progress Timer
                   */
                  ProgressTimer(),
                ],
              ),
              Lottie.asset("assets/animated_icons/quiz_screen_icon.json",
                  width: width * 0.38),

              /**
                 * The Card that contain ( Question & Answer options )
                 */
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Container(
                  width: width,
                  height: height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: PageView.builder(
                    itemCount: controller.questionsList.length,
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => QuestionCard(
                        questionModel: controller.questionsList[index]),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              /**
               * smooth page indicator
               */
              SmoothPageIndicator(
                controller: controller.pageController, // PageController
                count: controller.questionsList.length,
                effect: const ScaleEffect(
                    dotWidth: 20,
                    dotHeight: 7,
                    paintStyle: PaintingStyle.fill,
                    dotColor: Colors.white,
                    activeDotColor: Color.fromARGB(
                        255, 112, 71, 226) // your preferred effect
                    ),
              ),
              SizedBox(height: height * 0.02),

              /**
               * button to move next Question
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: GetBuilder<QuizController>(
                      init: QuizController(),
                      builder: (controller) => GestureDetector(
                          child: Container(
                            width: width * 0.34,
                            height: height * 0.06,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(0.75),
                            decoration: BoxDecoration(
                              gradient: btnPrimaryGradient,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  size: width * 0.07,
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                const Text(
                                  "Next",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            controller.nextQuestion();
                          }),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
