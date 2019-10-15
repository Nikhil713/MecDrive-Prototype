import 'package:flutter/material.dart';
import 'package:mec_drive/authentication/httpRequest.dart';
import 'package:mec_drive/authentication/newSignup.dart';
import 'package:mec_drive/googleAuth/gAuth.dart';
import 'HomeScreen/homeScreen.dart';
import 'driverlist/driverList.dart';
import 'splashscreen/splashscreen.dart';
import './profile_page/profile.dart';
import './authentication/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "carpool",
      home:GAuth(),
      // home: ProfilePage(),
      // home: Http(), 
      // home: DriversListPage(),
      // home: Loading(),
      // home: Loginpage(),
    );
  }
}
