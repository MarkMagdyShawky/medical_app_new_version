// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app_new_version/componants/constants.dart';
import 'package:medical_app_new_version/onbording_screen.dart';
import 'package:medical_app_new_version/questions.dart';

class MyHomeButton extends StatelessWidget {
  const MyHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor4,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.home,
        color: Colors.black,
      ),
    );
  }
}

class MyFileButton extends StatelessWidget {
  const MyFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyQuestionsPage()));
      },
      color: kPrimaryColor,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 95, left: 95),
      height: 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: const Icon(Icons.edit_document),
    );
  }
}
