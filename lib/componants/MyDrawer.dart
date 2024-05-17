import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_app_new_version/Login.dart';
import 'package:medical_app_new_version/componants/constants.dart';
import 'package:medical_app_new_version/home.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/painting.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:medical_app_new_version/onbording_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer header
          DrawerHeader(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Row(children: [
                Text('VitaCare',
                    style: GoogleFonts.acme(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
                // Image.asset(
                //   "assets/AppLogo1.png",
                //   width: 65,
                //   height: 65,
                // ),
              ])),
          // Home icon and btn
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          // Get Start icon and btn
          ListTile(
            leading: const Icon(Icons.start),
            title: const Text('Get Start'),
            onTap: () {
              // Navigate to settings screen or perform any action
              Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
            },
          ),
          // Result btn

          // Contact us icon and btn
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('Contact us'),
            onTap: () {
              // Navigate to about screen or perform any action
            },
          ),
          const Divider(),
          // btn for Logout
          // new eddit hear
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async {
              FirebaseAuth auth = FirebaseAuth.instance;
              User? user = auth.currentUser;

              try {
                if (user != null && !user.isAnonymous) {
                  // Check if the user is logged in with Google
                  if (user.providerData.any((userInfo) => userInfo.providerId == 'google.com')) {
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    await googleSignIn.disconnect();
                  }
                }
              } catch (e) {
                print('Error disconnecting Google account: $e');
                // Handle the error here (e.g., show a snackbar or dialog)
              }
              await auth.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
