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
  String status = "waiting";

  void _confirmRide() {
    setState(() {
      status = "loading";
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        status = "finished";
      });
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
            height: 20.0,
          ),
          // Confirm Ride button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              renderWidget(status)
            ],
          ),
        ],
      )),
    );
  }




Widget renderWidget(String status) {

  if (status == "waiting") {
    return Container(
        width: 200.0,
        height: 50.0,
        child: RaisedButton(
          child: Text(
            "Confirm Ride",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          padding: EdgeInsets.all(5.0),
          color: Colors.green,
          textColor: Colors.white,
          onPressed: _confirmRide,
        ));
  }

  if (status == "loading") {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    );
  }

  if(status == "finished"){
    return RaisedButton(
      color: Colors.white,
      textColor: Colors.green,
      onPressed: (){},
      child: Text("Done"),
    );
  }
}

}
