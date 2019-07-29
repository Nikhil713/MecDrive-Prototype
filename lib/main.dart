import 'package:flutter/material.dart';
import './authentication/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/signup': (BuildContext context) => AuthPage(),
      },
      home: Mainwidget(),
    );
  }
}

class Mainwidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(title: Text('List of all pages for testing'),),
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