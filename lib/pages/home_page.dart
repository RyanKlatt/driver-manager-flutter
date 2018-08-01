import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Card(
    color: Theme.of(context).accentColor,
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: const Icon(Icons.access_time),
          title: const Text('Time Clock'),
          subtitle: const Text('You are currently clocked out'),
        ),
        new ButtonTheme.bar( // make buttons use the appropriate styles for cards
          child: new ButtonBar(
            children: <Widget>[
              new FlatButton(
                child: const Text('Clock In'),
                textColor: Colors.white,
                onPressed: () { /* ... */ },
              ),
              new FlatButton(
                child: const Text('Clock Out'),
                textColor: Colors.grey,
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}