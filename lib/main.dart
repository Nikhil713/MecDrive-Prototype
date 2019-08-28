import 'package:flutter/material.dart';
import 'package:mec_drive/Widgets/HomeScreen/homeScreen.dart';
import 'loginpage/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "carpool",
      home: HomeScreen(),
      // home: Loginpage(),
      // home: Loading(),
      // home: RidesPage(),
    );
  }
}
