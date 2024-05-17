import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app_new_version/Login.dart';
import 'package:medical_app_new_version/LoginSiginupComponants/LoginSignupFooter.dart';
import 'package:medical_app_new_version/LoginSiginupComponants/LoginSignupHeader.dart';
import 'package:medical_app_new_version/componants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:medical_app_new_version/home.dart';
import 'package:medical_app_new_version/onbording_screen.dart';

class MySignupPage extends StatefulWidget {
  const MySignupPage({key});

  @override
  State<MySignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyLoginPage _createMyLoginPage() => MyLoginPage();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            LoginSignupHeader(
              pageTitle: "Sign up",
              imageLocation: "assets/login.svg",
              subtitle: "Create new account",
            ),
            const SizedBox(
              height: 20,
            ),
            _inputs(context),
            const SizedBox(
              height: 20,
            ),
            LoginSignupFooter(
              question: "Already have account? ",
              nextPage: _createMyLoginPage,
              btnName: "Login",
            )
          ],
        ),
      ),
    );
  }

// ////////////////////////////////////////////////
  _inputs(context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: username,
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: kPrimaryColor.withAlpha(50),
                filled: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: kPrimaryColor.withAlpha(50),
                filled: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: kPrimaryColor.withAlpha(50),
                filled: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  setState(() {
                    AwesomeDialog(
                      btnOkIcon: CupertinoIcons.airplane,
                      showCloseIcon: true,
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.scale,
                      title: 'Sucessfully',
                      desc: 'Login Sucessfully',
                      btnOkOnPress: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
                      },
                    ).show();
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    setState(() {
                      AwesomeDialog(
                        btnOkIcon: CupertinoIcons.repeat,
                        showCloseIcon: true,
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.scale,
                        title: 'Again',
                        desc: 'The password provided is too weak',
                        btnOkOnPress: () {},
                      ).show();
                    });
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    setState(() {
                      AwesomeDialog(
                        btnOkIcon: CupertinoIcons.airplane,
                        showCloseIcon: true,
                        btnOkText: "Login",
                        btnCancelText: "Try again",
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.scale,
                        title: 'Alert',
                        desc: 'The account already exists for that email',
                        btnOkOnPress: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => MyLoginPage()));
                        },
                        btnCancelOnPress: () {},
                      ).show();
                    });
                    print('The account already exists for that email.');
                  } else {
                    setState(() {
                      AwesomeDialog(
                        btnOkIcon: CupertinoIcons.repeat,
                        showCloseIcon: true,
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.scale,
                        title: 'Alert',
                        desc: 'Something went wrong',
                        btnOkOnPress: () {},
                      ).show();
                    });
                  }
                } catch (e) {
                  print(e);
                }
              }
            },
            color: kPrimaryColor,
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 90, left: 90),
            height: 30,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
            child: const Text(
              "Sign UP",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
