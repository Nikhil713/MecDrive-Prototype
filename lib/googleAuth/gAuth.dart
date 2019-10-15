import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class GAuth extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GAuth> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 130,
          ),
          Image.asset('assets/SignUp2.jpg'),
          SizedBox(
            height: 130,
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
