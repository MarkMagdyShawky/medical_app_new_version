// ignore: unnecessary_import
import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_app_new_version/componants/constants.dart';
import 'package:medical_app_new_version/firebase_options.dart';
import 'package:medical_app_new_version/home.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:medical_app_new_version/onbording_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('========================User is currently signed out!');
      } else {
        print('========================User is signed in!');
      }
    });
    super.initState();
  }

  // GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VitaCare',
      theme: ThemeData(
        textTheme: GoogleFonts.agbalumoTextTheme(Theme.of(context).textTheme),
        primaryColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black, size: 35),
          backgroundColor: kPrimaryColor,
          elevation: 10,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 200,
        duration: 400,
        splash: CircleAvatar(
          backgroundImage: AssetImage("assets/vitacare.png"),
          radius: 90,
        ),
        nextScreen: (FirebaseAuth.instance.currentUser != null) ? OnBoardingScreen() : MyHomePage(),
      ),
    );
  }
}
