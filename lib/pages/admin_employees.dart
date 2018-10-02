import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/create_time_clock.dart';

class Employess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmployeesState();
  }
}

class _EmployeesState extends State<Employess> {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Card(
      key: new ValueKey(document.documentID),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            onTap: () {
              print('hello');
            },
            leading: CircleAvatar(
                backgroundImage: new NetworkImage(
                    'https://avatars0.githubusercontent.com/u/10793020?s=460&v=4')),
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
              'Ryan Klatt',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              document['clockInTime'] + ' - ' + document['clockOutTime'],
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
          "Employees",
        ),
      ),
      body: new StreamBuilder(
          stream: Firestore.instance.collection('timeClock').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }),
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
