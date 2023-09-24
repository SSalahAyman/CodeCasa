import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      required this.textColor,
      required this.backgroundColor,
      this.textString,
      required this.onTap,
      this.icon,
      this.index,
      required this.item});

  final Color textColor;
  final Color backgroundColor;
  final String? textString;
  final VoidCallback onTap;
  final Icon? icon;
  final int? index;
  final String item;

  static late double width;
  static late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(width * 0.2),
        ),
        child: Center(
          child: item == "text"
              ? Text(
                  textString!,
                  style: TextStyle(
                      fontSize: 28, color: textColor, fontFamily: 'RobotoMono'),
                )
              : icon,
        ),
      ),
    );
  }
}
