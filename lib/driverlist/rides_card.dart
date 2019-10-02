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
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: -8.0,
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(12, 15, 12, 5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
        margin: EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _showDetails(),
          ],
        ));
  }

  Widget _createImage() {
    return Container(
      width: 80.0,
      height: 80.0,
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
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(0, 0, 0, .7)),
    );
  }

  Widget _showDetails() {
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.only(top: 5.0),
      child: Row(
        children: <Widget>[
          Text(
            'Class : ' +
                rides['class'] +
                '\nPhone : ' +
                rides['phone'] +
                '\nTime : ' +
                rides['time'] +
                '\nDestination : ' +
                rides['destination']+
                '\nPrice : ' +
                rides['price'] + 'Rs.',
            style: TextStyle(
                fontSize: 13.0,
                // fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, .6)),
          ),
        ],
      ),
    );
  }
}
