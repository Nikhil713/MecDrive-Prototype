// import 'dart:ui';

import 'package:flutter/material.dart';

enum carpool { yes, no }
carpool value = carpool.yes;

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  String dropdownbranchvalue = 'CSA';
  String dropdownyearvalue = '1';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _createnamefield() {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(
              Icons.person_outline,
              color: Color(0xFFFF794A),
            ),
            labelText: 'Name',
            filled: true,
            fillColor: Colors.white),
        // obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          } else
            return null; //Remove
        },
        onSaved: (String value) {
          _formData['password'] = value;
        },
      ),
    );
  }

  Widget _createbranchfield() {
    return Container(
      width: 150,
      child: Center(
        child: Row(children: <Widget>[
          Text('Branch :'),
          DropdownButton<String>(
            // isExpanded: true,
            value: dropdownbranchvalue,
            onChanged: (String newValue) {
              setState(() {
                dropdownbranchvalue = newValue;
              });
            },
            items: <String>['CSA', 'CSB', 'ECA', 'ECB', 'EEE', 'EB']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }

  Widget _createyearfield() {
    return Container(
      width: 150,
      child: Center(
        child: Row(children: <Widget>[
          Text('Year :'),
          DropdownButton<String>(
            // isExpanded: true,
            value: dropdownyearvalue,
            onChanged: (String newValue) {
              setState(() {
                dropdownyearvalue = newValue;
              });
            },
            items: <String>['1', '2', '3', '4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }

  Widget _createphonefield() {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            icon: Icon(
              Icons.phone,
              color: Color(0xFFFF794A),
            ),
            labelText: 'Phone Number',
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }

  Widget _createradio() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text('Do you own a vehicle ?'),
      Radio(
        value: carpool.yes,
        groupValue: value,
        onChanged: (carpool valuelocal) => setState(() {
          value = valuelocal;
        }),
      ),
      Radio(
        value: carpool.no,
        groupValue: value,
        onChanged: (carpool valuelocal) => setState(() {
          value = valuelocal;
        }),
      )
    ]);
  }

  Widget _buildbutton(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return RaisedButton(
      onPressed: _submitForm,
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        width: width * .8,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0x00FFFFFF)),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFF8684B),
              Color(0xFFFF794A),
              Color(0xFFFE8B4A),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Center(
          child: Text(
            'REGISTER',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    print(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Top Secret',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _createnamefield(),
                    SizedBox(
                      height: 15.0,
                    ),
                    _createbranchfield(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _createyearfield(),
                    _createphonefield(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _createradio(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildbutton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
