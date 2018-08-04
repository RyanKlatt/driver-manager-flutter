import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new ListView (
    children: [Card(
      color: Theme.of(context).accentColor,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: Icon(Icons.access_time),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print('hello');
              },
            ),
            title: Text('Time Clock'),
            subtitle: Text('You are currently clocked out!'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                new RaisedButton(
                  child: new Text('Clock In', 
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                  textColor: Colors.white,
                  color: Colors.green[700],
                  splashColor: Colors.green,
                  padding: EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
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
          new ListTile(
            leading: Icon(Icons.build),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print('hello');
              },
            ),
            title: const Text('Maintenance'),
            subtitle: const Text('Last Inspection - 7/31/2018'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                new FlatButton(
                  child: const Text('Add Inspection'),
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
          ListTile(
            leading: Icon(Icons.attach_money),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print('hello');
              },
            ),
            title: const Text('Expenses'),
            subtitle: const Text('Last Expense - 7/28/2018'),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                new FlatButton(
                  child: const Text('Add Expense'),
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
          new ListTile(
            leading: Icon(Icons.calendar_today),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print('hello');
              },
            ),
            title: const Text('Calendar'),
            subtitle: const Text('Meeting - 8/8/2018'),
          ),
        ],
      ),
    ),],
  );
}