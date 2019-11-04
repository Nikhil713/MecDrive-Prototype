import 'package:flutter/material.dart';
import 'package:mec_drive/HomeScreen/homeScreen.dart';
import 'package:mec_drive/authentication/newSignup.dart';
import 'package:mec_drive/splashscreen/splashscreen.dart';
import 'package:mec_drive/credits/credits.dart';
import 'AcceptedList/AcceptedDriversPage.dart';
import 'package:mec_drive/profile_page/profile.dart';
import './phonecall/phonecall.dart';
import './HomeScreen/myRequests/myRequests.dart';

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
      home: Mainwidget(),
      routes: {
        '/splashscreen': (BuildContext context) => SplashScreen(),
        '/credits': (BuildContext context) => Credits(),
        '/homescreen': (BuildContext context) => HomeScreen(),
        '/signup': (BuildContext context) => SignUp(),
        '/accepteddriverspage': (BuildContext context) => AcceptedDriversPage(),
        '/profilepage': (BuildContext context) => ProfilePage(),
        '/myrequests': (BuildContext context) => MyRequests(),
      },
    );
  }
}

class Mainwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pages'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/credits');
            },
            child: Text('Credits'),
          ),
          call('7907070036'),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/splashscreen');
            },
            child: Text('Splash Screen'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homescreen');
            },
            child: Text('Home Screen'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Text('Signup Page'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/accepteddriverspage');
            },
            child: Text('Accepted Drivers'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profilepage');
            },
            child: Text('Profile Page'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/myrequests');
            },
            child: Text('Requests Page'),
          ),
        ],
      ),
    );
  }
}
