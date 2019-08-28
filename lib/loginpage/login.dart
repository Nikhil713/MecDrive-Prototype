import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginbg.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text('Absolute'),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'Request a Ride !',
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFF555555)),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          'Many Desktop publishing packages and web page editors now use Lorem Ipsum !',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFF555555)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        color: Colors.white,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:15),
                          child: Text('LOGIN WITH GOOGLE'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
