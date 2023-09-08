import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/quiz_controller.dart';

class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super(key: key);
  final controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - (controller.sec.value / 15),
              color: const Color(0xff37e9bb),
              backgroundColor: Colors.grey,
              strokeWidth: 9,
            ),
            Center(
              child: Text(
                '${controller.sec.value}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
