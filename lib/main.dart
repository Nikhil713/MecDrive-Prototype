import 'package:flutter/material.dart';
import 'package:mec_drive/HomeScreen/homeScreen.dart';
import 'package:mec_drive/authentication/googleAuth.dart';
import 'package:mec_drive/authentication/newSignup.dart';
import 'package:mec_drive/splashscreen/splashscreen.dart';
import 'package:mec_drive/credits/credits.dart';
import 'AcceptedList/AcceptedDriversPage.dart';
import 'package:mec_drive/profile_page/profile.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "carpool",
      // home: SplashScreen(),
      // home: AcceptedDriversPage(),
      // home: RideRequestList(),
      // home: SignUp(),
      // home:ProfilePage(),
      home: Credits(),
      routes: {
        '/homescreen' : (context) => HomeScreen(),
      },
    );
  }
}
