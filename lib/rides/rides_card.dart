import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  final Map<String, dynamic> rides;
  final int ridesIndex;

  RideCard(this.rides, this.ridesIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 10.0,
                  spreadRadius: -8.0,
                )],
      ),
      margin: EdgeInsets.only(top: 18.0, left: 20.0, right: 20.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            _showname(),
            // Horizontal Bar after Name
            Container(
              margin: EdgeInsets.all(10.0),
              height: 0.5,
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
            //Row with Image & Details
            Row(
              children: <Widget>[
                _createImage(),
                Expanded(child: _personDetails())
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _personDetails() {
    return Container(
        margin: EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _showDetails(),
            _showprice(),
            _showPlaceName(),
          ],
        ));
  }

  Widget _createImage() {
    return Container(
      width: 130.0,
      height: 130.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(rides['image']),
        ),
      ),
    );
  }

  Widget _showname() {
    return Text(
      rides['name'],
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald',color: Color.fromRGBO(0, 0, 0, .7)),
    );
  }

  Widget _showDetails() {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Text(
        'Class : ' + rides['class'] + '\nPhone : ' + rides['phone']+'\n'+'Time : ' + rides['time'],
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'Oswald',
          color: Color.fromRGBO(0, 0, 0, .6)
        ),
      ),
    );
  }


  Widget _showPlaceName() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Text('Destination : ' + rides['destination']),
      ),
    );
  }

  Widget _showprice() {
    final price = rides['price'].toString();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(100, 100, 100, 1),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        'Price : ' + price + ' Rs',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
