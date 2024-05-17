// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medical_app_new_version/componants/MyButtons.dart';
import 'package:medical_app_new_version/componants/MyDrawer.dart';
import 'package:medical_app_new_version/componants/constants.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_app_new_version/componants/medical-api.dart';
import 'dart:convert' as convert;

import 'package:medical_app_new_version/result_loading.dart';

class MyQuestionsPage extends StatefulWidget {
  const MyQuestionsPage({super.key});

  @override
  State<MyQuestionsPage> createState() => _MyQuestionsPageState();
}

class _MyQuestionsPageState extends State<MyQuestionsPage> {
  //new edit here ->>>>>> function to replace each null value in answers list
  List<bool> replaceNullsWithFalse(List<bool?> list) {
    return list.map((value) => value ?? false).toList();
  }

// imges list for each symptom
  List<String> photos = [
    "fever.gif", //
    "cough.gif", //
    "runny_nose.png", //
    "sore_throat.png", //
    "fatigue.png", //
    "body_aches.json", //
    "rash.png", //
    "itchiness.png", //
    "swollen_glands.png", //
    "vomiting.png", //
    "diarrhea.png", //
    "abdominal_pain.png", //
    "ear_pain.png", //
    "sneezing.json", //
    "itchy_eyes.png", //
    "frequent_urination.png", //
    "unexplained_weight_loss.png", //
    "dehydration.png", //
    "difficulty_breathing.png", //
    "difficulty_sleeping.png", //
    "blisters.png", //
    "excessive_thirst.png", //
    "nasal_congestion.png", //
    "headache.png",
  ];

  GlobalKey<FormState> formState = GlobalKey();

//////////////////////////////////////////////
  int currentQuestionIndex = 0;
  late List<String> questions;
  late List<String> show;
  late List<bool?> answervalues;
  // Map sort the result of each question in the runtime
  Map<String, bool?> answers = {};
  // List for Questions

  @override
  void initState() {
    super.initState();
    questions = [
      "fever",
      "cough",
      "runny_nose",
      "sore_throat",
      "fatigue",
      "body_aches",
      "rash",
      "itchiness",
      "swollen_glands",
      "vomiting",
      "diarrhea",
      "abdominal_pain",
      "ear_pain",
      "sneezing",
      "itchy_eyes",
      "frequent_urination",
      "unexplained_weight_loss",
      "dehydration",
      "difficulty_breathing",
      "difficulty_sleeping",
      "blisters",
      "excessive_thirst",
      "nasal_congestion",
      "headache",
    ];

    show = [
      "fever",
      "cough",
      "runny nose",
      "sore throat",
      "fatigue",
      "body aches",
      "rash",
      "itchiness",
      "swollen glands",
      "vomiting",
      "diarrhea",
      "abdominal pain",
      "ear pain",
      "sneezing",
      "itchy eyes",
      "frequent urination",
      "unexplained weight loss",
      "dehydration",
      "difficulty breathing",
      "difficulty sleeping",
      "blisters",
      "excessive thirst",
      "nasal congestion",
      "headache",
    ];
    answervalues =
        List.filled(questions.length, null); // Initialize answervalues with the same length as questions
  }

// go to newt quest and stop at quset number questions.length - 1
  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex += 1;
      } else {
        showanswer(); // Call showanswer() when the last question is reached
      }
    });
  }

  Map<String, bool?> combineListsIntoMap(List<String> keys, List<bool?> values) {
    Map<String, bool?> resultMap = {};
    for (int i = 0; i < keys.length; i++) {
      resultMap[keys[i]] = values[i];
    }
    return resultMap;
  }

// the numbers that linked with the questions
  void goToQuestion(int index) {
    setState(() {
      currentQuestionIndex = index;
    });
  }

// {index : answer}
  void showanswer() async {
    // new edit here --->>>>>>>>>>
    List<bool> newAnswers = replaceNullsWithFalse(answervalues);
    // setState(()async {
    if (currentQuestionIndex == questions.length - 1) {
      answers = combineListsIntoMap(questions, newAnswers);
      print('User Answers: $answers');
      // Call the api function and handle the result
      var resultresponse = await api(convert.jsonEncode(answers));
      print('API Response: $resultresponse');
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => splashscreen(resultresponse)));

      // You can handle the API response here
    } else {
      print("==== no answer is here ");
    }
  }
//////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 35,
      ),
      floatingActionButton: const MyHomeButton(),
      drawer: MyDrawer(),
      body: Container(
        child: ListView(
          children: [
            _slideShow(context),
            __welecome(context),
            const SizedBox(
              height: 25,
            ),
            _questList(context)
          ],
        ),
      ),
    );
  }

  _slideShow(context) {
    return Container(
      child: ImageSlideshow(
        width: double.infinity,
        initialPage: 0,
        height: 220,
        indicatorColor: Colors.blue[400],
        indicatorBackgroundColor: Colors.grey,
        indicatorBottomPadding: 0,
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        autoPlayInterval: 8000,
        isLoop: true,
        children: [
          SvgPicture.asset(
            "assets/quize3.svg",
            height: 250,
            width: 220,
          ),
          SvgPicture.asset(
            "assets/quize2.svg",
            height: 250,
            width: 220,
          ),
          SvgPicture.asset(
            "assets/quize1.svg",
            height: 250,
            width: 220,
          ),
        ],
      ),
    );
  }

  __welecome(context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            "Let's Go",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          child: const Text("Answer this Questions please", style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }

  _questList(context) {
    return Column(children: [
      // Numerical List ---->>>
      Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                questions.length,
                (index) => Padding(
                  // space between each btn
                  padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                  // btn
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    height: 40,
                    minWidth: 50,
                    color: kPrimaryColor4,
                    /////// on press -->>>
                    onPressed: () => goToQuestion(index),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          )),
      const SizedBox(
        height: 10,
      ),
      ////// Questions--->
      Card(
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: const Color.fromARGB(255, 239, 210, 255),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            // color: kPrimaryColor.withAlpha(40),
            // color: kBackgroundColor2.withAlpha(300),
            color: kNewColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /////// Q n --->>>
              Row(
                children: [
                  // New Editing for images
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Q${currentQuestionIndex + 1}- Do you have ${show[currentQuestionIndex]}?",
                      style: GoogleFonts.agbalumo(fontSize: 18.0),
                    ),
                  ),
                  Expanded(flex: 2, child: chooseImage("symptoms/${photos[currentQuestionIndex]}")),
                ],
              ),

              const SizedBox(height: 15.0),

              /// Radio btns
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<bool>(
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    value: true,
                    groupValue: answervalues[currentQuestionIndex],
                    onChanged: (value) {
                      setState(() {
                        answervalues[currentQuestionIndex] = value!;
                      });
                    },
                  ),
                  const Text(
                    'Yes             ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Radio<bool>(
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    value: false,
                    groupValue: answervalues[currentQuestionIndex],
                    onChanged: (value) {
                      setState(() {
                        answervalues[currentQuestionIndex] = value!;
                      });
                    },
                  ),
                  const Text(
                    'No',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              // show the answer on the terminal

              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: goToNextQuestion,
                        child: const Text(
                          'Next',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

// choose or determinate image xtension
Widget chooseImage(String photo) {
  if (photo.endsWith(".json")) {
    return Lottie.asset(
      "$photo",
      width: 65,
      height: 65,
    );
  } else {
    return Image.asset(
      "$photo",
      width: 65,
      height: 65,
    );
  }
}
