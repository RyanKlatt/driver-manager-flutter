import 'package:flutter/material.dart';

class InspectionCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          centerTitle: true,
          title: Text(
            "Add Inspection",
          ),
        ),
        body: new Column(
          children: <Widget>[TextField()],
        ));
  }
}
