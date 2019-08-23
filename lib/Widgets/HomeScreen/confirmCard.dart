import 'package:flutter/material.dart';

class ConfirmCard extends StatelessWidget {
  final String location;
  final TimeOfDay time;

  ConfirmCard(this.location, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      // color: Colors.black,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0)
        )
      ),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Model Engineering College"),
            subtitle: Text("Thrikkakara"),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: location == ""
                ? Text("Destination not selected")
                : Text(location),
            subtitle: Text(time.toString()),
          )
        ],
      )),
    );
  }
}
