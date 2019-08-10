import 'package:flutter/material.dart';

class FindaRide extends StatefulWidget {
  @override
  _FindaRideState createState() => _FindaRideState();
}

class _FindaRideState extends State<FindaRide> {
  // Destination
  String destination = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
        height: 350.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Starting Location
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8.0)),
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  "Model Engineering College",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                subtitle: Text("Thrikkakara"),
              ),
            ),
            // Destination
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8.0)),
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Destination",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                  onChanged: (String val) {
                    setState(() {
                      destination = val;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
