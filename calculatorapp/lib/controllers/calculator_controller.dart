import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  dynamic input = "";
  var answer = '';
  final List<dynamic> buttons = const [
    "AC",
    "C",
    "÷",
    "%",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "^",
    "0",
    ".",
    "=",
  ];

  void handleButtonPress(var buttonText) {
    if (buttonText == 'AC') {
      clear();
    } else if (buttonText == "C") {
      deleteLastCharacter();
    } else if (buttonText == '=') {
      evaluateExpression();
    } else {
      appendToInput(buttonText);
    }

    update();
  }

  void clear() {
    input = '';
    answer = '';

    update();
  }

  void deleteLastCharacter() {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }

    update();
  }

  void appendToInput(var value) {
    input = input + value;

    update();
  }

  void evaluateExpression() {
    try {
      String userQuestion = input;
      userQuestion = userQuestion.replaceAll("x", "*");
      Parser p = Parser();
      Expression exp = p.parse(userQuestion);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      input = eval.toString();
    } catch (e) {}

    update();
  }

  bool isoperator(String x) {
    if (x == "%" ||
        x == "÷" ||
        x == "x" ||
        x == "-" ||
        x == "+" ||
        x == "=" ||
        x == "^") {
      return true;
    }
    return false;
  }
}
