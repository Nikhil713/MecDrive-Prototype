import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class GoogleSignIn extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GoogleSignIn> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 110,
          ),
          Text(
            "Carpool",
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
          Container(
            child:Text(
              "Nikhil Babu is awesome!!!There are no words to describe his greatness",
              style: TextStyle(fontSize: 17, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.all(20),
          ),
          Image.asset('assets/gauth.png'),
          SizedBox(
            height: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                // child: RaisedButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: new BorderRadius.circular(30.0),
                //   ),
                //   color: Colors.white,
                //   onPressed: () {},
                //   child: Column(
                //     // padding: const EdgeInsets.symmetric(vertical: 15),
                //     children: <Widget>[
                //       Icon(Icons.add),
                //       Text('LOGIN WITH GOOGLE')
                //     ],
                child: GoogleSignInButton(
                  onPressed: () {},
                  darkMode: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
