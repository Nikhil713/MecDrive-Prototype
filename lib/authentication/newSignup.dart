import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //loading check
  bool isLoading = false;

  // Form field variables
  String name = "";
  int phone = 0;
  String branch = "CSA";
  String year = '1';
  int carpool;

  // Save user information in shared preferences
  saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name);
    prefs.setInt('userPhone', phone);
    prefs.setString('userBranch', branch);
    prefs.setString('userYear', year);
    if (carpool == 1)
      prefs.setBool('carpool', true);
    else
      prefs.setBool('carpool', false);
  }

  void loadingDialog() {
    //show Alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        );
      },
    );

    Future.delayed(Duration(
      seconds: 3,
    ),(){
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/homescreen');
    });


    //Submit form to the backend
    // submitForm().then((e) {
    //   Navigator.pop(context);
    //   Navigator.pushReplacementNamed(context, '/homescreen');
    // }).catchError((e){
    //   print(e + "did not work");
    // });
  }

  // Submit the user details to database
  Future<String> submitForm() async {
    //save user information in shared preferences
    saveUserInfo();

    // String url = 'http://192.168.0.103:8000';
    Map<String, String> headers = {"Content-type": "application/json"};

    Map<String, dynamic> signUp = {
      "name": name,
      "branch": branch,
      "year": year,
      "phone": phone,
      "acceptedRides": []
    };

    String json = signUp.toString();
    // Make post request
    await http.post(
      Uri.http("localhost:8000", "/api/user/"),
      headers: headers,
      body: json,
    ).then((e){
      return e;
    }).catchError((e){
      print(e + "did not work");
    });
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Image(
                width: 320.0,
                image: AssetImage("assets/SignUp2.jpg"),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              // Sign Up container
              Container(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                width: 300.0,
                height: 420.0,
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
                child: Form(
                  key: formKey,
                  autovalidate: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // UserName
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Name",
                            icon: Icon(Icons.account_circle)),
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontFamily: "Poppins"),
                        validator: (value) {
                          if (value.isEmpty) return "Name field is required";
                          return '';
                        },
                        onSaved: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                      ),
                      // Phone
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Phone", icon: Icon(Icons.phone)),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) return "Phone no is required";
                          return ';';
                        },
                        onSaved: (val) {
                          setState(() {
                            phone = int.parse(val);
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      // Branch
                      Row(
                        children: <Widget>[
                          Text("Branch: ", style: TextStyle(fontSize: 17.0)),
                          Padding(padding: EdgeInsets.all(5.0)),
                          DropdownButton<String>(
                            value: branch,
                            items: <String>[
                              'CSA',
                              'CSB',
                              'ECA',
                              'ECB',
                              'EEE',
                              'EB'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                branch = value;
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          // Year
                          Text("Year: ", style: TextStyle(fontSize: 17.0)),
                          Padding(padding: EdgeInsets.all(5.0)),
                          DropdownButton<String>(
                            value: year,
                            items: <String>['1', '2', '3', '4']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String value) {
                              setState(() {
                                year = value;
                              });
                            },
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      // Carpool
                      Row(
                        children: <Widget>[
                          Text(
                            "Do you have a vehicle to pool?",
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(2.0)),
                      // RadioButton
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Yes:", style: TextStyle(fontSize: 17.0)),
                          Radio(
                            activeColor: Colors.green,
                            value: 1,
                            groupValue: carpool,
                            onChanged: (int val) {
                              setState(() {
                                carpool = val;
                              });
                            },
                          ),
                          Text("No:", style: TextStyle(fontSize: 17.0)),
                          Radio(
                            activeColor: Colors.green,
                            value: 0,
                            groupValue: carpool,
                            onChanged: (int val) {
                              setState(() {
                                carpool = val;
                              });
                            },
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      // Submit Button
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: RaisedButton(
                                  color: Colors.green,
                                  child: Text("Register"),
                                  textColor: Colors.white,
                                  onPressed: loadingDialog),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
