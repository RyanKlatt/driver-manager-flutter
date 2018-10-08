import 'package:flutter/material.dart';

import '../pages/create_inspection.dart';

class Maintenance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MaintenanceState();
  }
}

class _MaintenanceState extends State<Maintenance> {
  List<String> _inspections = [];

  Widget _buildExpense(BuildContext context, int index) {
    return Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            onTap: () {
              print('hello');
            },
            leading: IconButton(
              icon: Icon(
                Icons.edit,
                size: 40.0,
              ),
              onPressed: () {
                print('hello');
              },
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                size: 40.0,
              ),
              onPressed: () {
                print('hello');
              },
            ),
            title: Text(
              _inspections[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              r'100,000 miles - $119.00',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        centerTitle: true,
        title: Text(
          "Maintenance",
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: _inspections.length > 0
          ? ListView.builder(
              itemBuilder: _buildExpense,
              itemCount: _inspections.length,
            )
          : Center(
              child: Container(
                  child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('No Inspections Recorded!'),
              ],
            ))),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => InspectionCreatePage(),
              ),
            );
          },
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor),
    );
  }
}
