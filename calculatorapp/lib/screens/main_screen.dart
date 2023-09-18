import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static late double width;
  static late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff13141A),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),

            /**
             * Switch theme (Dark & Light) bar
             */
            Container(
              width: width * 0.23,
              height: height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.02,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff1F1F27),
                    radius: 17,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.moon_fill,
                        color: Color(0xffA66CFF),
                      ),
                      iconSize: 19,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.lightbulb_fill,
                      color: Color(0xffA0A1AC),
                    ),
                    iconSize: 19,
                  ),
                ],
              ),
            ),

            /**
             * Area for question & answer
             */
            Container(
              width: width,
              height: height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "5+10",
                        style: TextStyle(
                            color: Color(0xffA0A1AC),
                            fontSize: width * 0.07,
                            fontFamily: "RobotoMono"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "15",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.1,
                          // fontFamily: "RobotoMono",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
