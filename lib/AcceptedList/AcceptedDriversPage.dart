import 'package:flutter/material.dart';
import './acceptedList.dart';

class AcceptedDriversPage extends StatelessWidget {
  final List<Map<String, dynamic>> acceptedRides = [
    {
      'name': 'Elon Musk',
      'branch': 'SpaceX',
      'year': '2009',
      'price': '999',
      'phone': '912345678',
      'destination': 'Edapilly',
      'image': 'assets/elon.jpg',
      'time': '4 PM',
    },
    {
      'name': 'Joyal A Johney',
      'branch': 'CS',
      'year': '1998',
      'price': '10',
      'phone': '123456789',
      'destination': 'Angamaly',
      'image': 'assets/elon.jpg',
      'time': '6 AM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accepted Rides'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: acceptedList(acceptedRides),
      ),
    );
  }
}
