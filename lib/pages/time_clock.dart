import 'package:flutter/material.dart';

import '../pages/create_time_clock.dart';

class TimeClock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TimeClockState();
  }
}

class _TimeClockState extends State<TimeClock> {
  List<String> _clockRecords = [];

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
              _clockRecords[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              r'100,000 miles - $119.00',
              textAlign: TextAlign.center,
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
          "Time Clock",
        ),
      ),
      body: _clockRecords.length > 0
          ? ListView.builder(
              itemBuilder: _buildExpense,
              itemCount: _clockRecords.length,
            )
          : Center(
              child: Container(
                  child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[new Text('No Times Recorded!')],
            ))),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => TimeClockCreatePage(),
              ),
            );
          },
          heroTag: null,
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor),
    );
  }
}
