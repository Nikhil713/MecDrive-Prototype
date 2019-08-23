import 'package:flutter/material.dart';

class ConfirmCard extends StatelessWidget {
  final String location;
  final TimeOfDay time;

  ConfirmCard(this.location, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 300.0,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          // From
          ListTile(
            leading: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: Icon(Icons.location_on)),
            title: Text("Model Engineering College",
                style: TextStyle(color: Colors.white)),
            subtitle:
                Text("Thrikkakara", style: TextStyle(color: Colors.white)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                color: Color(0xFF808080),
                height: 2.0,
              ),
            ],
          ),
          // Destination
          ListTile(
            leading: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: Icon(Icons.location_on)),
            title: location == ""
                ? Text("Destination not selected",
                    style: TextStyle(color: Colors.white))
                : Text(location, style: TextStyle(color: Colors.white)),
            subtitle:
                Text(time.toString(), style: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 20.0,
          ),
          // Confirm Ride button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                width: 240.0,
                height: 50.0,
                child: GestureDetector(
                  child: Center(
                    child: Text(
                      "Confirm Ride",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20.0)),
              )
            ],
          )
        ],
      )),
    );
  }
}
