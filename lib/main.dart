import 'package:flutter/material.dart';
import 'package:mec_drive/HomeScreen/homeScreen.dart';
import 'package:mec_drive/authentication/googleAuth.dart';
import 'package:mec_drive/authentication/newSignup.dart';
import 'package:mec_drive/splashscreen/splashscreen.dart';
import 'AcceptedList/AcceptedDriversPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "carpool",
      // home: SplashScreen(),
      // home: AcceptedDriversPage(),
      // home: RideRequestList(),
      home: SignUp(),
      routes: {
        '/homescreen' : (context) => HomeScreen(),
      },
    );
  }
}
