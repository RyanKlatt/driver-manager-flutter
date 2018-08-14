import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<String> _expenses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        centerTitle: true,
        title: Text(
          "Expenses",
        ),
      ),
      body: ListView(children: [
        Column(
          children: _expenses
              .map((element) => Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          onTap: () {
                            print('hello');
                          },
                          leading: IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 40.0,
                            ),
                            onPressed: () {
                              print('hello');
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 40.0,
                            ),
                            onPressed: () {
                              print('hello');
                            },
                          ),
                          title: Text(
                            element,
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            r'100,000 miles - $119.00',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        )
      ]),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            setState(() {
              _expenses.add('another test');
            });
          },
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor),
    );
  }
}
