import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/screens/score_screen.dart';
import 'package:quizapp/screens/welcome_screen.dart';

class QuizController extends GetxController {
  String name = '';

  /**
   * Question model that contain question with answer
   */
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question:
          "Who developed Flutter Framework and continues to maintain it today? ",
      answer: 2,
      options: ['Facebook', 'Microsoft', 'Google ', 'Oracle'],
    ),
    QuestionModel(
      id: 2,
      question: "When google release Flutter ",
      answer: 2,
      options: ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    ),
    QuestionModel(
      id: 3,
      question:
          "Which programming language is used to build Flutter applications?  ",
      answer: 1,
      options: ['Kotlin', 'Dart', 'Java', 'c++'],
    ),
    QuestionModel(
      id: 4,
      question: "How many types of widgets are there in Flutter?  ",
      answer: 0,
      options: ['2', '4', '3', '6'],
    ),
    QuestionModel(
      id: 5,
      question:
          "Access to a cloud database through Flutter is available through which service?",
      answer: 1,
      options: ['SQLite', 'Firebase Database', 'NOSQL', 'MYSQL'],
    ),
    QuestionModel(
      id: 6,
      question: "which of these options works as state managment  ",
      answer: 3,
      options: ['BloC', 'GetX', 'Provider', 'All of the above'],
    ),
    QuestionModel(
      id: 7,
      question: "A memory location that holds a single letter or number.",
      answer: 2,
      options: ['Double', 'Int', 'Char', 'Word'],
    ),
  ];

  int get countOfQuestion => _questionsList.length;

  List<QuestionModel> get questionsList => [..._questionsList];

  bool _isPressed = false;

  //To check if the answer is pressed
  bool get isPressed => _isPressed;

  late double _numberOfQuestion = 1;

  double get numberOfQuestion => _numberOfQuestion;

  int? _selectAnswer;

  int? get selectAnswer => _selectAnswer;

  int? _correctAnswer;

  int _countOfCorrectAnswers = 0;

  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswerd = {};

  //page view controller
  late PageController pageController;

  //timer
  Timer? _timer;

  final maxSec = 15;

  final RxInt _sec = 15.obs;

  RxInt get sec => _sec;

  /**
   *  called immediately after the widget is allocated memory
   */
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  /**
   * called just before the Controller is deleted from memory
   */
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  /**
   * get final score of the Quiz
   */
  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
  }

  /**
   * method to check on the answer after click on any options
   */
  void checkAnswer(QuestionModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());
    update();
  }

  /**
   * this method check if the question has been answered
   */
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _questionsList.length - 1) {
      Get.to(ScoreScreen());
      _numberOfQuestion = pageController.page! + 1;
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      _numberOfQuestion = pageController.page! + 2;

      startTimer();
    }

    update();
  }

  /**
   * this method used to show right and wrong color in answer option
   */
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  /**
   * this method used to show right and wrong icon in answer option
   */
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  /**
   * this method called when you start again quiz
   */
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void resetTimer() {
    _sec.value = maxSec;
  }

  void stopTimer() {
    _timer!.cancel();
  }
}
