import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Icon(
          Icons.attach_money,
          size: 150.0,
          color: Colors.green
        ),
        new Text('Expenses tab content')
      ],
    )
  );
}