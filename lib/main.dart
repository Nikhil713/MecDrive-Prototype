import 'package:flutter/material.dart';
import 'package:mec_drive/authentication/httpRequest.dart';
import 'package:mec_drive/authentication/newSignup.dart';
import 'HomeScreen/homeScreen.dart';
import 'driverlist/driverList.dart';
import 'splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "carpool",
      home: Http(),
      // home: DriversListPage(),
      // home: Loading(),
    );
  }
}
