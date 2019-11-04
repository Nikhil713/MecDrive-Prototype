import 'package:flutter/material.dart';

class MyRequests extends StatefulWidget {
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  bool accept = true;

  // Cards showing user requests
  Widget _requestCards(BuildContext context, int index) {
    return Dismissible(
      key: Key(index.toString()),
      confirmDismiss: (DismissDirection direction) async {
        final bool res = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm"),
              content: Text("Are you sure you wish to delete this item?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("DELETE")),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("CANCEL"),
                ),
              ],
            );
          },
        );
        return res;
      },
      onDismissed: (direction) {
        print('Element at index '+index.toString()+' has been deleted.');
      },
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/elon.jpg"),
            ),
            title: Text("Destination"),
            subtitle: Text("Time: 5PM"),
            trailing: accept == true
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : null,
          ),
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
              itemBuilder: (BuildContext context, int index) =>
                  _requestCards(context, index),
            ),
          )
        ],
      ),
    );
  }
}
