import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

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
    return new DynamicTheme(
        defaultBrightness: Brightness.dark,
        data: (brightness) => new ThemeData(
              primaryColor: Colors.indigo[700],
              accentColor: Colors.grey[800],
              primaryColorDark: Colors.indigo[900],
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            title: 'Driver Manager',
            theme: theme,
            home: new MyHomePage(title: 'Driver Manager'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppHomeState();
  }
}

class _AppHomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void changeColor() {
      DynamicTheme.of(context).setThemeData(new ThemeData(
          accentColor: Theme.of(context).accentColor == Colors.white
              ? Colors.grey[800]
              : Colors.white,
          brightness: Theme.of(context).brightness == Brightness.light
              ? Brightness.dark
              : Brightness.light,
          primaryColor: Colors.indigo[700],
          primaryColorDark: Colors.indigo[900]));
    }

    return Scaffold(
        appBar: new AppBar(
          title: Text(widget.title),
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
                  style: new TextStyle(color: Colors.white),
                ),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: () {
                  changeColor();
                },
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.exit_to_app),
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
                  new Tab(icon: new Icon(Icons.build)),
                  new Tab(icon: new Icon(Icons.attach_money)),
                  new Tab(icon: new Icon(Icons.calendar_today)),
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
                new Calendar(),
              ],
            ),
          ),
        ));
  }
}
