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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('MEC ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: .7)),
                  Text(
                    'DRIVE',
                    style: TextStyle(
                        color: Color(0xFF5eb809),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: .7),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100.0,
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
              height: 40.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Carpool for Mecians',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
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
                    fontSize: 13.0,
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
