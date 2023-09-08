import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/screens/welcome_screen.dart';

class QuizController extends GetxController {
  String name = '';

  /**
   * Question model that contain question with answer
   */
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question: "Best Channel for Flutter ",
      answer: 2,
      options: [
        'Sec it',
        'Sec it developer',
        'sec it developers',
        'mesh sec it '
      ],
    ),
    QuestionModel(
      id: 2,
      question: "Best State Mangment Ststem is ",
      answer: 1,
      options: ['BloC', 'GetX', 'Provider', 'riverPod'],
    ),
    QuestionModel(
      id: 3,
      question: "Best Flutter dev",
      answer: 2,
      options: ['sherif', 'sherif ahmed', 'ahmed sherif', 'doc sherif'],
    ),
    QuestionModel(
      id: 4,
      question: "Sherif is",
      answer: 1,
      options: ['eng', 'Doc', 'eng/Doc', 'Doc/Eng'],
    ),
    QuestionModel(
      id: 5,
      question: "Best Rapper in Egypt",
      answer: 3,
      options: ['Eljoker', 'Abyu', 'R3', 'All of the above'],
    ),
    QuestionModel(
      id: 6,
      question: "Real Name of ahmed sherif",
      answer: 2,
      options: ['ahmed sherif', 'sherif', 'Haytham', 'NONE OF ABOVE'],
    ),
    QuestionModel(
      id: 7,
      question: "Sherif love",
      answer: 3,
      options: ['Pharma', 'Micro', 'Medicnal', 'NONE OF ABOVE'],
    ),
    QuestionModel(
      id: 8,
      question: "hello",
      answer: 3,
      options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
    ),
    QuestionModel(
      id: 9,
      question: "Best Channel for Flutter ",
      answer: 2,
      options: [
        'Sec it',
        'Sec it developer',
        'sec it developers',
        'mesh sec it '
      ],
    ),
    QuestionModel(
      id: 10,
      question: "Best State Mangment Ststem is ",
      answer: 1,
      options: ['BloC', 'GetX', 'Provider', 'riverPod'],
    ),
  ];

  int get countOfQuestion => _questionsList.length;

  List<QuestionModel> get questionsList => [..._questionsList];

  bool _isPressed = false;

  //To check if the answer is pressed
  bool get isPressed => _isPressed;

  double _numberOfQuestion = 1;

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

    // if (pageController.page == _questionsList.length - 1) {
    //   //------ go to result screen-----//
    // } else {
    //   _isPressed = false;
    //   pageController.nextPage(
    //       duration: const Duration(milliseconds: 500), curve: Curves.linear);

    //   startTimer();
    // }
    // _numberOfQuestion = pageController.page! + 2;
    // update();
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

  /**
   * this method called when start again quiz

   */
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    //--- navigate to welcome screen--//
  }
}
