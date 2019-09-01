import 'package:flutter/material.dart';
import 'HomeScreen/homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "carpool",
      home: HomeScreen(),
    );
  }
}
