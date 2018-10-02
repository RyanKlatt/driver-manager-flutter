import 'package:flutter/material.dart';

import '../pages/create_time_clock.dart';
import '../pages/create_inspection.dart';
import '../pages/create_expense.dart';

class AdminHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AdminHomeState();
  }
}

class _AdminHomeState extends State<AdminHome> {
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
                    Icons.person,
                    size: 40.0,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      DefaultTabController.of(context).animateTo(1);
                    },
                  ),
                  title: Text(
                    'Employees',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'On Clock: 5 | Off Clock: 20',
                    textAlign: TextAlign.center,
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
                    Icons.local_shipping,
                    size: 40.0,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      DefaultTabController.of(context).animateTo(2);
                    },
                  ),
                  title: new Text(
                    'Trucks',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Maintenance Issues: 0',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
