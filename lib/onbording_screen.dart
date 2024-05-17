import 'package:flutter/material.dart';
import 'package:medical_app_new_version/componants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:medical_app_new_version/getStart.dart';
import 'package:medical_app_new_version/intro_screens/intro_page_1.dart';
import 'package:medical_app_new_version/intro_screens/intro_page_2.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  // if we are on the last page or not
  bool onLastPge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPge = (index == 1);
                });
              },
              children: [IntroPage1(), IntroPage2()]),

          // dot indicators
          Container(
              alignment: Alignment(0, .9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  onLastPge
                      ? Container(width: 100, child: Text(""))
                      : Container(
                          width: 100,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return MyGetStartPage();
                                }));
                              },
                              child: const Text(
                                "Skip",
                                style: TextStyle(color: kPrimaryColor, fontSize: 20),
                              )),
                        ),

                  //dot indicators

                  SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: WormEffect(activeDotColor: kPrimaryColor),
                  ),

                  // next or done
                  onLastPge
                      ? Container(
                          width: 100,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return MyGetStartPage();
                              }));
                            },
                            child: const Text("Done", style: TextStyle(color: kPrimaryColor, fontSize: 20)),
                          ),
                        )
                      : Container(
                          width: 100,
                          child: TextButton(
                            onPressed: () {
                              _controller.nextPage(
                                  duration: const Duration(microseconds: 500), curve: Curves.easeIn);
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              color: kPrimaryColor,
                              size: 30,
                            ),
                          ),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
