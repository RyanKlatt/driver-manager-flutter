import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/time_clock.dart';
import 'pages/calendar.dart';
import 'pages/maintenance.dart';
import 'pages/expenses.dart';

void main() => runApp(new DriverManager());

class DriverManager extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Drawer Layout with Tabs',
      theme: new ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.grey[800],
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: "Driver Manager"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  "Ryan Klatt",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              ListTile(
                title: Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: new DefaultTabController(
          length: 5,
          child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.home)),
                  new Tab(icon: new Icon(Icons.access_time)),
                  new Tab(icon: new Icon(Icons.calendar_today)),
                  new Tab(icon: new Icon(Icons.build)),
                  new Tab(icon: new Icon(Icons.attach_money)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: new TabBarView(
              children: [
                new Home(),
                new TimeClock(),
                new Calendar(),
                new Maintenance(),
                new Expenses(),
              ],
            ),
          ),
        ));
  }
}