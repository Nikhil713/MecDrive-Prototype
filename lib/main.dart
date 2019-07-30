import 'package:flutter/material.dart';
import './authentication/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget { //Main App
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> { //State of Main App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secret App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/signup': (BuildContext context) => AuthPage(),
      },
      home: Mainwidget(), // Only for testing purposes
    );
  }
}

class Mainwidget extends StatelessWidget { //This widget is for testing & can be deleted when this main page os not needed.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of all pages for testing'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          RaisedButton(
            onPressed: () {
              print('Hello');
              Navigator.pushNamed(context, '/signup');
            },
            child: Text('Signup Page'),
          )
        ],
      ),
    );
  }
}

// End of main Widget
