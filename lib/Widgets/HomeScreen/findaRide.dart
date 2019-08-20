import 'package:flutter/material.dart';

class FindaRide extends StatefulWidget {
  @override
  _FindaRideState createState() => _FindaRideState();
}

class _FindaRideState extends State<FindaRide> {
  // Destination
  String destination = "";

  TimeOfDay pickedTime = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay response = await showTimePicker(
      context: context,
      initialTime: pickedTime,
    );
    if (response != null && response != pickedTime) {
      setState(() {
        pickedTime = response;
        print(pickedTime);
      });
    }
  } 

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Starting Location
            Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
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
                // color: Colors.blueAccent,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8.0)),
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    hintText: "Destination",
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
            ),
            // Time
            RaisedButton(
              child: Text("Time"),
              onPressed: () => _selectTime(context),
            ),
            // Confirm button
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Find A Ride",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              onTap: (){
                showBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 250,
                    color: Colors.blue,
                    child: Center(
                      child: Text("Test"),
                    ),
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
