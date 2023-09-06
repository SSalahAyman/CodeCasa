class QuestionModel {
  final int id;
  final int answer;
  final String question;
  final List<String> options;

  QuestionModel(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}
