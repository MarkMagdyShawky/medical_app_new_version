import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app_new_version/result.dart';

class splashscreen extends StatelessWidget {
  final Map<String, dynamic> apiresult;
  const splashscreen(this.apiresult, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      animationDuration: Duration(seconds: 5),
      // splashTransition: SplashTransition.decoratedBoxTransition,

      splashIconSize: 200,
      splash: Column(
        children: [Lottie.asset("animation/Animation4.json", width: 200, height: 200)],
      ),
      nextScreen: result(apiresult),
    );
  }
}
