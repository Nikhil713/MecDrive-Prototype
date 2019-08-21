import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 150.0,
            ),
            // Image(
            //   image: AssetImage('assets/logo.png'),
            //   width: 160.0,
            // ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'MEC DRIVE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 55.0,
                    fontFamily: 'titlefontt',
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),

            SizedBox(
              height: 50.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Carpool for Mecians',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Absolute™',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
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
