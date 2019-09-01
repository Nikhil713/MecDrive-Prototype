import 'package:flutter/material.dart';
import 'dart:async';

class ConfirmCard extends StatefulWidget {
  final String location;
  final TimeOfDay time;

  ConfirmCard(this.location, this.time);

  @override
  _ConfirmCardState createState() => _ConfirmCardState();
}

class _ConfirmCardState extends State<ConfirmCard> {
  String status = "booking";

  // Send ride request to server
  void _confirmRide(BuildContext context) {

    // alertbox
    final alertDialog = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          SizedBox(
            width: 40.0,
          ),
          Text(
            "Sending Request",
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog
    ); 

    // Snackbar
    final snack = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Request has been successfully sent!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: Duration(seconds: 2),
    );

    Timer(Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.pop(context);
      Scaffold.of(context).showSnackBar(snack);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 300.0,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
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
            title: widget.location == ""
                ? Text("Destination not selected",
                    style: TextStyle(color: Colors.white))
                : Text(widget.location, style: TextStyle(color: Colors.white)),
            subtitle: Text(widget.time.toString(),
                style: TextStyle(color: Colors.white)),
          ),
          SizedBox(
            height: 25.0,
          ),
          // Confirm Ride button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: RaisedButton(
                  onPressed: () => _confirmRide(context),
                  child: Center(
                    child: Text(
                      "Confirm Ride",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.green,
                  padding: EdgeInsets.all(12.0),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
