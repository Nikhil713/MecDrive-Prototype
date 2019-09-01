import 'package:flutter/material.dart';

class RideRequestList extends StatefulWidget {
  @override
  _RideRequestListState createState() => _RideRequestListState();
}

class _RideRequestListState extends State<RideRequestList> {

  Widget _requestCards(BuildContext context,int index) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/elon.jpg"),
          ),
          title: Text("Elon Musk"),
          subtitle: Row(
            children: <Widget>[
              Text("Branch:CSA"),
              SizedBox(width: 4.0),
              Text("Year:3")
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    ); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 4,
              itemBuilder: (BuildContext context,int index) =>_requestCards(context,index),
            ),
          )
        ],
      ),
    );
  }
}