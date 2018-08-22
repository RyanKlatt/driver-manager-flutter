import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class TimeClockCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TimeClockCreateState();
  }
}

class _TimeClockCreateState extends State<TimeClockCreatePage> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  var clockInController = new TextEditingController();
  var clockOutController = new TextEditingController();
  var dateController = new TextEditingController();

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

  Future<Null> _clockInTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        clockInController.text = '${_time.format(context)}';
      });
    } else if (picked != null) {
      setState(() {
        _time = picked;
        clockInController.text = '${_time.format(context)}';
      });
    }
  }

  Future<Null> _clockOutTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        clockOutController.text = '${_time.format(context)}';
      });
    } else if (picked != null) {
      setState(() {
        _time = picked;
        clockOutController.text = '${_time.format(context)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add Time Record'),
        centerTitle: true,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
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
                        icon: Icon(
                          Icons.date_range,
                          size: 40.0,
                        )),
                  ),
                )),
            GestureDetector(
                onTap: () => _clockInTime(context),
                child: AbsorbPointer(
                  child: TextField(
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).accentColor),
                    controller: clockInController,
                    decoration: InputDecoration(
                        labelText: 'Clock In Time',
                        labelStyle: TextStyle(fontSize: 20.0),
                        icon: Icon(
                          Icons.timer,
                          size: 40.0,
                        )),
                  ),
                )),
            GestureDetector(
                onTap: () => _clockOutTime(context),
                child: AbsorbPointer(
                  child: TextField(
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).accentColor),
                    controller: clockOutController,
                    decoration: InputDecoration(
                        labelText: 'Clock Out Time',
                        labelStyle: TextStyle(fontSize: 20.0),
                        icon: Icon(
                          Icons.timer_off,
                          size: 40.0,
                        )),
                  ),
                )),
            SizedBox(height: 10.0),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('Add'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
