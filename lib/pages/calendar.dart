import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Icon(
          Icons.calendar_today,
          size: 150.0,
          color: Colors.black12
        ),
        new Text('Calendar tab content')
      ],
    )
  );
}