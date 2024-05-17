import 'package:medical_app_new_version/Login.dart';
import 'package:medical_app_new_version/Signup.dart';
import 'package:medical_app_new_version/componants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: ListView(
          children: [
            _slideShow(context),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 7, left: 7),
              padding: const EdgeInsets.only(bottom: 105, top: 60),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                children: [
                  _welecome(context),
                  const SizedBox(
                    height: 50,
                  ),
                  _buttons(
                    context,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _slideShow(context) {
    return Container(
      child: ImageSlideshow(
        width: double.infinity,
        height: 425,
        initialPage: 0,
        indicatorColor: Color.fromARGB(255, 148, 193, 230),
        indicatorBackgroundColor: const Color.fromARGB(255, 231, 229, 229),
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        autoPlayInterval: 8000,
        isLoop: true,
        children: [
          SvgPicture.asset(
            "assets/doctor1.svg",
            fit: BoxFit.cover,
          ),
          SvgPicture.asset(
            "assets/18.svg",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  _welecome(context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("VitaCare",
                  style: GoogleFonts.acme(fontWeight: FontWeight.bold, fontSize: 40.0, color: kPrimaryColor)),
            ])),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: const Text("Welecome to VitaCare, Let's Start ", style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _buttons(context) {
    return Column(
      children: [
        // this container include two btns
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(500)),
          // first btn for Login ->> on pressed
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyLoginPage()));
            },
            color: kPrimaryColor,
            minWidth: 300,
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 90, left: 90),
            height: 30,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        // second btn for Sign up ->> on pressed

        MaterialButton(
          minWidth: 300,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MySignupPage()));
          },
          color: kPrimaryColor,
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 90, left: 90),
          height: 30,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 55,
        ),

        _languageBtn(context),
      ],
    );
  }

  _languageBtn(context) {
    return Column(
      children: [
        Container(
          child: Text(
            "Choose Language.",
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              color: kPrimaryColor,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              height: 30,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
              child: const Text(
                "English",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            MaterialButton(
              onPressed: () {},
              color: kPrimaryColor,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              height: 30,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
              child: const Text(
                "اللغة العربية",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
