import 'package:flutter/material.dart';

import '../pages/create_expense.dart';

class Expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<String> _expenses = [];

  Widget _buildExpense(BuildContext context, int index) {
    return Card(
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
            title: Text(_expenses[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400)),
            subtitle: Text(
              r'100,000 miles - $119.00',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

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
      body: _expenses.length > 0
          ? ListView.builder(
              itemBuilder: _buildExpense,
              itemCount: _expenses.length,
            )
          : Center(
              child: Container(
                  child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[new Text('No Expenses Recorded!')],
            ))),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ExpenseCreatePage(),
              ),
            );
          },
          heroTag: null,
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor),
    );
  }
}
