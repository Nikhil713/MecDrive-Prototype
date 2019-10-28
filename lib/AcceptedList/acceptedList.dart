import 'package:flutter/material.dart';

acceptedList(List acceptedDrivers) {
  var widgetList = <Widget>[];

  for (var i in acceptedDrivers) {
    widgetList.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Card(
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(i['image']),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    i['name'],
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    i['branch'],
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    i['price'] + ' Rs',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('+91 ' + i['phone']),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(i['destination']),
                  subtitle: Text('Time : '+ i['time']),
                ),
              ],
            )

            // Column(
            //   children: <Widget>[
            //     SizedBox(
            //       height: 10,
            //     ),
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            //       child: Row(
            //         children: <Widget>[
            //           Icon(Icons.phone, size: 25),
            //           SizedBox(
            //             width: 20,
            //           ),
            //           Text(
            //             i['phone'],
            //             style: TextStyle(fontSize: 17),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            //         child: Row(
            //           children: <Widget>[
            //             Icon(Icons.location_on, size: 25),
            //             SizedBox(
            //               width: 20,
            //             ),
            //             Text(
            //               i['destination'],
            //               style: TextStyle(fontSize: 17),
            //             ),
            //           ],
            //         )),
            //   ],
            // )
          ],
          trailing: SizedBox(),
        ),
      ),
    ));
  }

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
            SizedBox(
              height: 20,
            )
          ] +
          widgetList,
    ),
  );
}
