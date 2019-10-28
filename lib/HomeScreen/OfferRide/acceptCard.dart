import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './setPrice.dart';

class AcceptCard extends StatefulWidget {
  @override
  _AcceptCardState createState() => _AcceptCardState();
}

class _AcceptCardState extends State<AcceptCard> {
  var price = '0';
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      height: 320,
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          // User details
          Container(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/elon.jpg"),
              ),
              title: Text("Name of User"),
              subtitle: Row(
                children: <Widget>[
                  Text("Branch: CSA"),
                  SizedBox(width: 5),
                  Text("Year: 3"),
                ],
              ),
            ),
          ),
          // Ride Details -- Destination and Time
          Container(
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Destination"),
              subtitle: Text("Time : 5AM"),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.monetization_on,
            ),
            title: Text(
              price.toString()+' Rs',
              style: TextStyle(color: Color(0xFF444444)),
            ),
            trailing: RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("Set Price"),
              onPressed: () {
                showDialog(context: context, builder: (context) => SetPrice())
                    .then((newprice) {
                  setState(() {
                    price = newprice;
                  });
                });
              },
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: RaisedButton(
              // shape: ,
              elevation: 3,
              splashColor: Colors.greenAccent,
              color: Colors.black,
              textColor: Colors.white,
              child: Text(
                "Accept Ride",
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
