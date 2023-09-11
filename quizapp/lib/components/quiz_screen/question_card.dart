import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/quiz_controller.dart';
import 'package:quizapp/models/question_model.dart';
import 'answer_option.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel questionModel;

  const QuestionCard({super.key, required this.questionModel});

  static late double width;
  static late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      padding: EdgeInsets.all(3),
      height: height * 0.5,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.015,
          ),
          Text(
            questionModel.question,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: const Color(0xFF101010),
                ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          ...List.generate(
            questionModel.options.length,
            (index) => Column(
              children: [
                AnswerOption(
                    text: questionModel.options[index],
                    index: index,
                    questionId: questionModel.id,
                    onPressed: () {
                      Get.find<QuizController>()
                          .checkAnswer(questionModel, index);
                    }),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
