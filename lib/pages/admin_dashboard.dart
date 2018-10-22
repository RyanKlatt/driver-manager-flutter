import 'package:flutter/material.dart';
import 'admin_home_page.dart';
import 'admin_employees.dart';
import 'admin_trucks.dart';
import 'time_clock.dart';
import 'maintenance.dart';
import 'expenses.dart';

class AdminDashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AdminDashboardCreateState();
  }
}

class _AdminDashboardCreateState extends State<AdminDashboardPage> {
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
              new Tab(icon: new Icon(Icons.people)),
              new Tab(icon: new Icon(Icons.local_shipping)),
              new Tab(icon: new Icon(Icons.attach_money)),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: new TabBarView(
          children: [
            new AdminHome(),
            new TimeClock(),
            new Employess(),
            new Trucks(),
            new Expenses(),
          ],
        ),
      ),
    );
  }
}
