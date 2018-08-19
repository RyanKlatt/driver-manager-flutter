import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => new ListView(
        children: [
          Card(
            color: Theme.of(context).cardColor,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  onTap: () {
                    DefaultTabController.of(context).animateTo(1);
                  },
                  leading: Icon(
                    Icons.access_time,
                    size: 40.0,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      DefaultTabController.of(context).animateTo(1);
                    },
                  ),
                  title: Text(
                    '00:00:00',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'You are currently clocked out!',
                    textAlign: TextAlign.center,
                  ),
                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(
                        child: new Text(
                          'Clock In',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.green[700],
                        splashColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Theme.of(context).cardColor,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  onTap: () {
                    DefaultTabController.of(context).animateTo(2);
                  },
                  leading: Icon(
                    Icons.build,
                    size: 40.0,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      DefaultTabController.of(context).animateTo(2);
                    },
                  ),
                  title: new Text(
                    'Maintenance',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Last Inspection - 7/31/2018',
                    textAlign: TextAlign.center,
                  ),
                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FlatButton(
                        child: new Text(
                          'Add Inspection',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.grey[600],
                        splashColor: Colors.grey[400],
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Theme.of(context).cardColor,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  onTap: () {
                    DefaultTabController.of(context).animateTo(3);
                  },
                  leading: Icon(
                    Icons.attach_money,
                    size: 40.0,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      DefaultTabController.of(context).animateTo(3);
                    },
                  ),
                  title: new Text(
                    'Expenses',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Last Expense - 7/28/2018',
                    textAlign: TextAlign.center,
                  ),
                ),
                new ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FlatButton(
                        child: new Text(
                          'Add Expense',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        color: Colors.grey[600],
                        textColor: Colors.white,
                        splashColor: Colors.grey[400],
                        padding: EdgeInsets.symmetric(horizontal: 35.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /*Card(
            color: Theme.of(context).accentColor,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  onTap: () {
                    print('hello');
                  },
                  leading: Icon(Icons.calendar_today, size: 40.0),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      print('hello');
                    },
                  ),
                  title: new Text(
                    'Calendar',
                    style: new TextStyle(
                        fontSize: 19.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Meeting - 8/8/2018'),
                ),
              ],
            ),
          ),*/
        ],
      );
}
