import 'package:get/get.dart';
import 'package:quizapp/controllers/quiz_controller.dart';

class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
