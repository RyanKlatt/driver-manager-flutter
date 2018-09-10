import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class ExpenseCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpenseCreateState();
  }
}

class _ExpenseCreateState extends State<ExpenseCreatePage> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  var inspectionTimeController = new TextEditingController();
  var dateController = new TextEditingController();
  var truckController = new TextEditingController();
  var odometerController = new TextEditingController();
  var amountController = new TextEditingController();
  var gallonsController = new TextEditingController();

  String dropdownValue;

  @override
  void initState() {
    super.initState();

    dateController.text = '${new DateFormat.yMd().format((_date))}';
    truckController.text = '310040';
    Future.delayed(Duration(milliseconds: 100)).then((_) {
      inspectionTimeController.text = '${_time.format(context)}';
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2017),
        lastDate: new DateTime(2100));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        dateController.text = '${new DateFormat.yMd().format((_date))}';
      });
    } else if (picked != null) {
      setState(() {
        _date = picked;
        dateController.text = '${new DateFormat.yMd().format((_date))}';
      });
    }
  }

  Future<Null> _inspectionTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        inspectionTimeController.text = '${_time.format(context)}';
      });
    } else if (picked != null) {
      setState(() {
        _time = picked;
        inspectionTimeController.text = '${_time.format(context)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add Expense'),
        centerTitle: true,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new ListView(children: <Widget>[
          GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).accentColor),
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: TextStyle(fontSize: 20.0),
                  ),
                ),
              )),
          GestureDetector(
              onTap: () => _inspectionTime(context),
              child: AbsorbPointer(
                child: TextField(
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).accentColor),
                  controller: inspectionTimeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    labelStyle: TextStyle(fontSize: 20.0),
                  ),
                ),
              )),
          TextField(
            keyboardType: TextInputType.number,
            style:
                TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
            controller: truckController,
            decoration: InputDecoration(
              labelText: 'Truck #',
              labelStyle: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            keyboardType: TextInputType.number,
            style:
                TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
            controller: odometerController,
            decoration: InputDecoration(
              labelText: 'Odometer',
              labelStyle: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10.0),
          new DropdownButton<String>(
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).accentColor),
              hint: new Text('Select Fuel Type'),
              value: dropdownValue,
              onChanged: (String newValue) {
                // null indicates the user didn't select a
                // new value.
                setState(() {
                  if (newValue != null) dropdownValue = newValue;
                });
              },
              items: <String>['Unleaded', 'Diesel'].map((String value) {
                return new DropdownMenuItem<String>(
                    value: value, child: new Text(value));
              }).toList()),
          TextField(
            keyboardType: TextInputType.number,
            style:
                TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
            controller: amountController,
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: TextStyle(fontSize: 20.0),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            style:
                TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
            controller: gallonsController,
            decoration: InputDecoration(
              labelText: 'Gallons',
              labelStyle: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text(
              'Upload Receipt',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text(
              'Save',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
