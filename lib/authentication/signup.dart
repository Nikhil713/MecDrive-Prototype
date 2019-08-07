import 'package:flutter/material.dart';

// This is used for Radio button
enum carpool { yes, no }
carpool value = carpool.yes;

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  // Sign up form details
  final Map<String, dynamic> _formData = {
    'name': null,
    'phone': null,
    'branch': null,
    'year': null,
  };
  // Value selected by Drodown to select Branch
  String dropdownbranchvalue = 'CSA';
  // Value selected by Dropdown to select year
  String dropdownyearvalue = '1';
  // Creating form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Creates the Text Field
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
        validator: (String value) {
          // Validating the text field on submit
          if (value.isEmpty) {
            return 'Name is Required';
          } else
            return null;
        },
        onSaved: (String value) {
          _formData['name'] = value;
        },
      ),
    );
  }

  // Creates Field to input Phone Number
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
        // Validates input
        validator: (String value) {
          if (value == null) {
            return null;
          }
          final n = num.tryParse(value);
          if (n == null) {
            return 'Input is not a valid number';
          }
          return null;
        },
        onSaved: (String value) {
          _formData['phone'] = value;
        },
      ),
    );
  }

  // Created DropDown to select branch
  Widget _createbranchfield() {
    return Container(
      width: 150,
      child: Center(
        child: Row(children: <Widget>[
          Text('Branch :'),
          DropdownButton<String>(
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

  // Creates DropDown to select year
  Widget _createyearfield() {
    return Container(
      width: 150,
      child: Center(
        child: Row(children: <Widget>[
          Text('Year :'),
          DropdownButton<String>(
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

// Creates Radio Buttons to select if user has a vehicle.
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

// Creates Button to Submit the form
  Widget _createbutton(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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

// Runs when the Button is Clicked.
  void _submitForm() {
    // Change condition to prevent form submission
    // formKey.currentState.validate() runs validator of all fields
    if (!_formKey.currentState.validate()) {
      return;
    }
    // The next line runs onSaved attribute of all text fields.
    _formKey.currentState.save();
    _formData['branch'] = dropdownbranchvalue;
    _formData['year'] = dropdownyearvalue;
    print(_formData);
// Do something here after form is submitted
  }

// Build Widget of this page.
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
                    _createnamefield(), // Creates Name Text Field
                    SizedBox(
                      height: 15.0,
                    ),
                    _createbranchfield(), // Creates Branch Drop Down
                    SizedBox(
                      height: 10.0,
                    ),
                    _createyearfield(), // Creates Year Drop Down
                    _createphonefield(), // Creates Phone Number Field
                    SizedBox(
                      height: 30.0,
                    ),
                    _createradio(), // Creates Radio Button
                    SizedBox(
                      height: 30.0,
                    ),
                    _createbutton(context), // Creates the submit button
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
