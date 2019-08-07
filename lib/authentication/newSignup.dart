import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String branch = "CSA";
  String year = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image(
                image: AssetImage("assets/signup.png"),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 140.0,
              ),
              Container(
                // Container design
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
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
                  child: ListView(
                    children: <Widget>[
                      // UserName
                      TextFormField(
                        decoration: InputDecoration(labelText: "Name"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(13.0),
                      ),
                      // Branch
                      Row(
                        children: <Widget>[
                          Text("Branch: ", style: TextStyle(fontSize: 18.0)),
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
                          Text("Year: ", style: TextStyle(fontSize: 18.0)),
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
                                branch = value;
                              });
                            },
                          )
                        ],
                      ),
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
