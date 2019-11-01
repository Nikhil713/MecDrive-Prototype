import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Widget call(number) {
  return RaisedButton(
    onPressed: () {
      _openPhone('tel: ' + number);
    },
    child: Text('Call ' + number),
  );
}

_openPhone(url) async {
  if (await canLaunch(url) && url != '') {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
