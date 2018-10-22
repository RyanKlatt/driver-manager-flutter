import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/employee_dashboard.dart';
import 'pages/admin_dashboard.dart';

void main() => runApp(new DriverManager());

class DriverManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
              primaryColor: Colors.indigo[700],
              cardColor: Colors.white,
              accentColor: Colors.indigo,
              primaryColorDark: Colors.indigo[900],
              brightness: brightness,
              textTheme: TextTheme(subhead: TextStyle(fontSize: 20.0)),
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
  bool _isDarkTheme;

  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = (prefs.getBool('isDark') ?? false);
      if (_isDarkTheme == false) {
        DynamicTheme.of(context).setThemeData(new ThemeData(
          accentColor: Colors.indigo,
          cardColor: Colors.white,
          brightness: Brightness.light,
          primaryColor: Colors.indigo[700],
          primaryColorDark: Colors.indigo[900],
          textTheme: TextTheme(subhead: TextStyle(fontSize: 20.0)),
        ));
      } else {
        DynamicTheme.of(context).setThemeData(new ThemeData(
          accentColor: Colors.grey[350],
          cardColor: Colors.grey[700],
          brightness: Brightness.dark,
          primaryColor: Colors.grey[800],
          primaryColorDark: Colors.grey[900],
          textTheme: TextTheme(subhead: TextStyle(fontSize: 20.0)),
        ));
      }
    });
    print(_isDarkTheme);
  }

  _saveTheme(bool themeValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = (prefs.getBool('isDark') ?? false);
    setState(() {
      _isDarkTheme = themeValue;
      changeColor();
    });
    prefs.setBool('isDark', _isDarkTheme);
  }

  void changeColor() {
    DynamicTheme.of(context).setThemeData(new ThemeData(
      accentColor: Theme.of(context).accentColor == Colors.indigo
          ? Colors.grey[350]
          : Colors.indigo,
      cardColor: Theme.of(context).cardColor == Colors.white
          ? Colors.grey[700]
          : Colors.white,
      brightness: Theme.of(context).brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      primaryColor: Theme.of(context).primaryColor == Colors.indigo[700]
          ? Colors.grey[800]
          : Colors.indigo[700],
      primaryColorDark: Theme.of(context).primaryColorDark == Colors.indigo[900]
          ? Colors.grey[900]
          : Colors.indigo[900],
      textTheme: TextTheme(subhead: TextStyle(fontSize: 20.0)),
    ));
  }

  @override
  Widget build(BuildContext context) {
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
                  print('hello');
                },
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              new Divider(),
              new SwitchListTile(
                title: new Text('Dark Theme'),
                activeColor: Theme.of(context).primaryColor,
                value: _isDarkTheme,
                onChanged: (bool themeValue) {
                  setState(() {
                    _isDarkTheme = themeValue;
                    _saveTheme(_isDarkTheme);
                  });
                },
              )
            ],
          ),
        ),
        body: new AdminDashboardPage());
  }
}
