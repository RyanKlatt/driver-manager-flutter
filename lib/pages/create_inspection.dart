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
  var truckController = new TextEditingController();

  String typeValue;
  String issueValue;

  bool _isChecked = false;

  int _radioValue = 0;

  bool _isVisible = false;

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

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      _isVisible = !_isVisible;
    });
  }

  _buildExpansionTile() {
    return DropdownButtonHideUnderline(
      child: new DropdownButton<String>(
        hint: Text('Select Truck Issues'),
        style: TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
        value: issueValue,
        onChanged: (String newValue) {
          setState(() {
            issueValue = newValue;
          });
        },
        items: <String>['Engine', 'Transmission', 'Clutch'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
      ),
    );
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
        child: new ListView(
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
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).accentColor),
              controller: truckController,
              decoration: InputDecoration(
                labelText: 'Truck #',
                labelStyle: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10.0),
            DropdownButtonHideUnderline(
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
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                labelText: 'Odometer',
                labelStyle: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10.0),
            new Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
              new Text('Any issues with truck?'),
              new Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              new Text('No'),
              new Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              new Text('Yes'),
            ]),
            _isVisible ? _buildExpansionTile() : new SizedBox(height: 10.0),
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
