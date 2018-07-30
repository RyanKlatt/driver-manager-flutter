import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new DriverManager());

class DriverManager extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Drawer Layout with Tabs',
      theme: new ThemeData(
        primaryColor: Colors.green,
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
                  "Hello Andy!!",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Colors.green),
              ),
              ListTile(
                title: Text("First"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Second"),
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
                new Icon(Icons.home, size: 50.0,),
                new Icon(Icons.access_time,size: 50.0,),
                new Icon(Icons.calendar_today,size: 50.0,),
                new Icon(Icons.build,size: 50.0,),
                new Icon(Icons.attach_money,size: 50.0,),
              ],
            ),
          ),
        ));
  }
}