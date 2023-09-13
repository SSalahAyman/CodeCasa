import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/quiz_controller.dart';
import 'package:quizapp/screens/quiz_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static late double width;
  static late double height;

  static const routeName = '/welcome_screen';

  final GlobalKey<FormState> _formkey = GlobalKey();

  final _nameController = TextEditingController();

  late QuizController controller;

  final btnPrimaryGradient = const LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/backgrounds/welcome_screen.jpg"),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: width,
                height: height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: const Row(
                        children: [
                          Text(
                            "Let's Play Quiz,",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.04),
                      child: const Row(
                        children: [
                          Text(
                            "Enter your name below ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Form(
                      key: _formkey,
                      child: GetBuilder<QuizController>(
                        init: Get.put(QuizController()),
                        builder: (controller) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: TextFormField(
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return 'Name should not be empty';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (String? val) {
                              controller.name = val!.trim().toUpperCase();
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                              if (!_formkey.currentState!.validate()) return;
                              _formkey.currentState!.save();
                              Get.to(() => QuizScreen());
                              Get.find<QuizController>().startTimer();
                            },
                            controller: _nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFF1F1147),
                                hintText: "Full Name",
                                labelText: "Enter you full name",
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.7),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.7),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.11),
                child: Container(
                  width: width * 0.6,
                  height: height * 0.06,
                  child: GestureDetector(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(0.75), // 15
                        decoration: BoxDecoration(
                          gradient: btnPrimaryGradient,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Let's Start Quiz",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                      onTap: () {
                        /**
                         * code to navigate to quiz screen
                         */
                        FocusScope.of(context).unfocus();
                        if (!_formkey.currentState!.validate()) return;
                        _formkey.currentState!.save();
                        Get.to(() => QuizScreen());
                        Get.find<QuizController>().startTimer();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
