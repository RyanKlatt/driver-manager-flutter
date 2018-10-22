import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/create_time_clock.dart';

class ManagementContacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ManagementContactsState();
  }
}

class _ManagementContactsState extends State<ManagementContacts> {
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
                radius: 30.0,
                backgroundImage: new NetworkImage(
                    'https://avatars0.githubusercontent.com/u/10793020?s=460&v=4')),
            trailing: IconButton(
              icon: Icon(Icons.access_time, size: 40.0, color: Colors.green),
              tooltip: 'On the clock!',
              onPressed: () {
                print('hello');
              },
            ),
            title: Text('Ryan Klatt',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400)),
            subtitle: Text(
              'Manager',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: IconButton(
                      icon: Icon(
                        Icons.call,
                        size: 30.0,
                      ),
                      onPressed: () {}),
                ),
                IconButton(
                    icon: Icon(Icons.message, size: 30.0), onPressed: () {}),
              ],
            ),
          ),
          SizedBox(height: 10.0),
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
          "Contacts",
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
    );
  }
}
