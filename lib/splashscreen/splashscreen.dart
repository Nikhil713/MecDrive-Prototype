import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.2, 0.55, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(180, 180, 180, 1),
            Color.fromRGBO(255, 255, 255, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/logo.png'),
                width: 250.0,
              ),
            ),
            SizedBox(
              height: 90.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/loading.gif'),
                width: 80.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
