import 'package:flutter/material.dart';

class OfferRide extends StatefulWidget {
  @override
  _OfferRideState createState() => _OfferRideState();
}

class _OfferRideState extends State<OfferRide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("offer a ride"),
          onPressed: (){},
        ),
      ),
    );
  }
}