import 'package:calculatorapp/components/button.dart';
import 'package:calculatorapp/controllers/calculator_controller.dart';
import 'package:calculatorapp/theme/default_colors.dart';
import 'package:calculatorapp/theme/theme_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static late double width;
  static late double height;

  bool isDark = false;

  final ThemeServiceController _themeController =
      Get.put(ThemeServiceController());

  @override
  void initState() {
    super.initState();
    isDark = _themeController.loadThemeFromBox();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: isDark ? primaryClrDark : primaryClrLight,
        body: GetBuilder<CalculatorController>(
          init: CalculatorController(),
          builder: (_controller) {
            return Container(
              width: width,
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),

                  /**
             * Switch theme (Dark & Light) bar
             */
                  Container(
                    width: width,
                    height: height * 0.05,
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              print('Theme Changed !!');
                              isDark = !isDark;
                              _themeController.saveThemeToBox(isDark);
                              Get.changeThemeMode(
                                  _themeController.getThemeMode());
                            });
                          },
                          icon: Icon(
                            CupertinoIcons.moon_stars,
                            color: isDark ? purpleClrDark : Colors.grey[600],
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /**
             * Area for question & answer
             */
                  Container(
                    width: width,
                    height: height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.04),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: (Text(
                              _controller.input,
                              style: GoogleFonts.robotoMono(
                                  color: isDark
                                      ? questionclrDark
                                      : questionClrLight,
                                  fontSize: width * 0.07),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.04),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: (Text(
                              _controller.answer,
                              style: GoogleFonts.robotoMono(
                                  color: isDark ? white : black,
                                  fontSize: width * 0.08),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /**
             * Area for Gridview opertions & numbers
             */
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02, vertical: height * 0.01),
                    width: width,
                    height: height * 0.6,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: width * 0.04,
                          crossAxisSpacing: height * 0.03,
                          crossAxisCount: 4),
                      itemCount: _controller.buttons.length,
                      itemBuilder: (BuildContext context, int index) {
                        /**
                   * clear button
                   */
                        if (index == 0) {
                          return MyButton(
                              textColor:
                                  isDark ? purpleClrDark : purpleClrLight,
                              backgroundColor: isDark
                                  ? btnBackgroundClrDark
                                  : btnBackgroundClrLight,
                              textString: _controller.buttons[index],
                              onTap: () {
                                _controller.handleButtonPress(
                                    _controller.buttons[index]);
                              });
                        }

                        /**
                   * delete button
                   */
                        else if (index == 1) {
                          return MyButton(
                            textColor: isDark ? purpleClrDark : purpleClrLight,
                            backgroundColor: isDark
                                ? btnBackgroundClrDark
                                : btnBackgroundClrLight,
                            onTap: () {
                              _controller.handleButtonPress(
                                  _controller.buttons[index]);
                            },
                            textString: _controller.buttons[index],
                          );
                        }

                        /**
                   * equal button
                   */
                        else if (index == 19) {
                          return MyButton(
                            textColor: isDark ? purpleClrDark : purpleClrLight,
                            backgroundColor: isDark
                                ? btnBackgroundClrDark
                                : btnBackgroundClrLight,
                            textString: _controller.buttons[index],
                            onTap: () {
                              _controller.handleButtonPress(
                                  _controller.buttons[index]);
                            },
                          );
                        }

                        /**
                   * numbers & operators
                   */
                        else {
                          return MyButton(
                            textColor: isoperator(_controller.buttons[index])
                                ? isDark
                                    ? purpleClrDark
                                    : purpleClrLight
                                : isDark
                                    ? white
                                    : black,
                            backgroundColor: isDark
                                ? btnBackgroundClrDark
                                : btnBackgroundClrLight,
                            onTap: () {
                              _controller.handleButtonPress(
                                  _controller.buttons[index]);
                            },
                            textString: _controller.buttons[index],
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  /**
   * function to check item in button list is operator or not 
   */
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
