import 'package:flutter/material.dart';

class Credits extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Credits',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        // elevation: 200,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          // SizedBox(height: 1.0),
          Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 20,
            // SizedBox(height: 15.0),

            child: Column(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/profilepic.jpeg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 9.0, color: Colors.black)
                      ]),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: Text(
                    'A  CS',
                    style: TextStyle(
                      fontSize: 30.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/profilepic.jpeg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 9.0, color: Colors.black)
                      ]),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: Text(
                    'B  CS',
                    style: TextStyle(
                      fontSize: 30.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/profilepic.jpeg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 9.0, color: Colors.black)
                      ]),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: Text(
                    'C  CS',
                    style: TextStyle(
                      fontSize: 30.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
