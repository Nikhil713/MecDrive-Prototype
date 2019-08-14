import 'package:flutter/material.dart';
import './rides_Card.dart';

class RidesPage extends StatelessWidget {
  // Hard Coded Data
  final List<Map<String, dynamic>> ridesData = [
    {
      'name': 'Elon Musk',
      'class': 'CS10A',
      'price': 999,
      'phone' : '912345678',
      'destination':'Edapilly',
      'image': 'assets/elon.jpg',
      'time':'4 PM',
    },
        {
      'name': 'Joyal',
      'class': 'CS5A',
      'price': 10,
      'phone' : '123456789',
      'destination':'Edapilly',
      'image': 'assets/elon.jpg',
      'time':'6 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 235, 1),
      appBar: AppBar(
        title: Text(
          'Available Rides',
          style: TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color.fromRGBO(100, 100, 100, 1)),
        centerTitle: true,
      ),
      body: PageContent(ridesData),
    );
  }
}

// Generating Rides list from list
class PageContent extends StatelessWidget {
  final List<Map<String, dynamic>> rideData;

  PageContent(this.rideData);

  @override
  Widget build(BuildContext context) {
    Widget listOfRides;
    //If list length is 0 return Empty Container else return cards.
    if (rideData.length > 0) {
      listOfRides = ListView.builder(
        //
        itemBuilder: (BuildContext context, int index) =>
            RideCard(rideData[index], index),
        itemCount: rideData.length,
      );
    } else {
      listOfRides = Container();
    }
    return listOfRides;
  }
}
