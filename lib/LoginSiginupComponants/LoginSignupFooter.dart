import 'package:flutter/material.dart';
import 'package:medical_app_new_version/componants/constants.dart';
import 'package:medical_app_new_version/Signup.dart';
import 'package:medical_app_new_version/Login.dart';

class LoginSignupFooter extends StatelessWidget {
  final String question;
  final Function() nextPage;
  final String btnName;
  LoginSignupFooter({required this.question, required this.nextPage, required this.btnName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$question",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage()));
          },
          child: Text(
            "$btnName",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
