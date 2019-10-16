import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
            ),
            Container(
              // color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'MEC ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: .7,
                    ),
                  ),
                  Text(
                    'Drive',
                    style: TextStyle(
                      color: Color(0xFF5eb809),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: .7,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/3,
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Carpool for Mecians',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 17.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Text(
                  'Absolute™',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontFamily: 'new',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
