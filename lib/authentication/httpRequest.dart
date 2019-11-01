import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Http extends StatefulWidget {
  @override
  _HttpState createState() => _HttpState();
}

class _HttpState extends State<Http> {

  List<dynamic> userList = [];

  // POST request
  postData(){
    final Map<String,dynamic> userInfo = {
      'name'    : "Tom Cruise",
      'branch'  : "CS",
      'year'    : "3",
      'phone'   : 9388605225,
      'acceptedRides' : []
    };
    http.post(
      "http://192.168.0.103:8000/api/user/",
      headers: {"Content-Type": "application/json"},
      body: json.encode(userInfo)).
      then((http.Response response){
        final Map<String,dynamic> responseData = json.decode(response.body);
        print(responseData);
      });
  }

  String name = "";
  // GET Request
  getData() {
    http.get("http://192.168.0.103:8000/api/user/").
    then((http.Response response) {
      print(json.decode(response.body));
      final List<dynamic> parsed = json.decode(response.body);

      setState(() {
       userList = []; 
      });

      parsed.forEach((dynamic user){
        userList.add(user);
      });
      setState(() {

      });
    });
  }

  Widget cards(BuildContext context,int index) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(userList[index]["name"]),
            Text(userList[index]["branch"]),
            Text(userList[index]["year"]),
            Text(userList[index]["phone"].toString()),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40,),
          RaisedButton(
            child: Text("Get Data"),
            onPressed: getData,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context,int index) => cards(context,index),
            ),
          )
        ],
      ),
    );
  }
}