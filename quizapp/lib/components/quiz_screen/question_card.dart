import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      height: height * 0.5,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            questionModel.question,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Color(0xFF101010),
                ),
          ),
        ],
      ),
    );
  }
}
