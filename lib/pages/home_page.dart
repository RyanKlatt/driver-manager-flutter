import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Column (
    children: [Card(
      color: Theme.of(context).accentColor,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Time Clock'),
            subtitle: const Text('You are currently clocked out!'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new RaisedButton(
                  child: const Text('Clock In'),
                  textColor: Colors.white,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                  onPressed: () { /* ... */ },
                ),
                new RaisedButton(
                  child: const Text('Clock Out'),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () { /* ... */ },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Card(
      color: Theme.of(context).accentColor,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendar'),
            subtitle: const Text('Meeting on 8/8/2018'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('View Calendar'),
                  textColor: Colors.white,
                  onPressed: () { /* ... */ },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Card(
      color: Theme.of(context).accentColor,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.build),
            title: const Text('Maintenance'),
            subtitle: const Text('Your last inspection was on 7/31/2018'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('Add Inspection'),
                  textColor: Colors.white,
                  onPressed: () { /* ... */ },
                ),
                new FlatButton(
                  child: const Text('View Previous Inspections'),
                  textColor: Colors.white,
                  onPressed: () { /* ... */ },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Card(
      color: Theme.of(context).accentColor,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Expenses'),
            subtitle: const Text('Your last expense was recorded on 7/28/2018'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('Add Expense'),
                  textColor: Colors.white,
                  onPressed: () { /* ... */ },
                ),
                new FlatButton(
                  child: const Text('View Previous Expenses'),
                  textColor: Colors.white,
                  onPressed: () { /* ... */ },
                ),
              ],
            ),
          ),
        ],
      ),
    )],
  );
}