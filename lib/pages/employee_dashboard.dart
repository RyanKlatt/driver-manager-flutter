import 'package:flutter/material.dart';
import 'home_page.dart';
import 'time_clock.dart';
import 'maintenance.dart';
import 'expenses.dart';
import 'management_contacts.dart';

class EmployeeDashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmployeeDashboardCreateState();
  }
}

class _EmployeeDashboardCreateState extends State<EmployeeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 5,
      child: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[],
          title: new TabBar(
            tabs: [
              new Tab(icon: new Icon(Icons.home)),
              new Tab(icon: new Icon(Icons.access_time)),
              new Tab(icon: new Icon(Icons.build)),
              new Tab(icon: new Icon(Icons.attach_money)),
              new Tab(icon: new Icon(Icons.people)),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: new TabBarView(
          children: [
            new Home(),
            new TimeClock(),
            new Maintenance(),
            new Expenses(),
            new ManagementContacts(),
          ],
        ),
      ),
    );
  }
}
