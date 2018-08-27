import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class InspectionCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InspectionCreateState();
  }
}

class _InspectionCreateState extends State<InspectionCreatePage> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  var inspectionTimeController = new TextEditingController();
  var dateController = new TextEditingController();
  String typeValue;

  @override
  void initState() {
    super.initState();

    dateController.text = '${new DateFormat.yMd().format((_date))}';
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
        title: new Text('Add Inspection'),
        centerTitle: true,
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                onTap: () => _inspectionTime(context),
                child: AbsorbPointer(
                  child: TextField(
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).accentColor),
                    controller: inspectionTimeController,
                    decoration: InputDecoration(
                        labelText: 'Time',
                        labelStyle: TextStyle(fontSize: 20.0),
                        icon: Icon(
                          Icons.access_time,
                          size: 40.0,
                        )),
                  ),
                )),
            SizedBox(height: 10.0),
            Center(
              child: new DropdownButton<String>(
                hint: Text('Inspection Type'),
                style: TextStyle(
                    fontSize: 20.0, color: Theme.of(context).accentColor),
                value: typeValue,
                onChanged: (String newValue) {
                  setState(() {
                    typeValue = newValue;
                  });
                },
                items: <String>['Pre-Trip', 'Post-Trip', 'Other']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
