import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginSignupHeader extends StatelessWidget {
  late final String pageTitle;
  late final String subtitle;
  late final String imageLocation;

  LoginSignupHeader(
      {super.key, required this.pageTitle, required this.imageLocation, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$pageTitle",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SvgPicture.asset(
          "$imageLocation",
          width: 400,
          height: 350,
        ),
        Text(
          "$subtitle",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
