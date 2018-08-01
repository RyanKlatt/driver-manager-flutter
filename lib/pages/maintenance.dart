import 'package:flutter/material.dart';

class Maintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Icon(
          Icons.build,
          size: 150.0,
          color: Colors.black12
        ),
        new Text('Maintenance tab content')
      ],
    )
  );
}