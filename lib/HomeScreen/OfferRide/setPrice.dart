import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetPrice extends StatelessWidget {
  String price;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: Text('Enter Price'),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          onChanged: (value) {
            price = value;
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Price',
            icon: Icon(Icons.monetization_on),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Set Price"),
          onPressed: () {
            Navigator.of(context).pop(price);
          },
        ),
      ],
    );
  }
}
