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
  var odometerController = new TextEditingController();
  var otherIssuesController = new TextEditingController();

  bool isEngineChecked = false;
  bool isTransmissionChecked = false;
  bool isClutchChecked = false;
  bool isSteeringMechChecked = false;
  bool isHornChecked = false;
  bool isWipersChecked = false;
  bool isWindshieldChecked = false;
  bool isMirrorsChecked = false;
  bool isLightingChecked = false;
  bool isParkingChecked = false;
  bool isBrakesChecked = false;
  bool isTiresChecked = false;
  bool isWheelsChecked = false;
  bool isEmergencyChecked = false;
  bool isRegistrationChecked = false;
  bool isAnnualChecked = false;
  bool isOilChecked = false;

  String issueValue;

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
    return Center(
        child: new Column(
      children: <Widget>[
        Divider(),
        SizedBox(height: 10.0),
        Text(
          'Select Truck Issues',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 10.0),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isEngineChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isEngineChecked = newValue;
                });
              },
            ),
            Text('Engine'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isTransmissionChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isTransmissionChecked = newValue;
                });
              },
            ),
            Text('Transmission'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isClutchChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isClutchChecked = newValue;
                });
              },
            ),
            Text('Clutch'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isSteeringMechChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isSteeringMechChecked = newValue;
                });
              },
            ),
            Text('Steering Mechanism'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isHornChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isHornChecked = newValue;
                });
              },
            ),
            Text('Horn'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isWipersChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isWipersChecked = newValue;
                });
              },
            ),
            Text('Windshield Wipers'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isWindshieldChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isWindshieldChecked = newValue;
                });
              },
            ),
            Text('Windshield Cracked'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isMirrorsChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isMirrorsChecked = newValue;
                });
              },
            ),
            Text('Mirrors'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isLightingChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isLightingChecked = newValue;
                });
              },
            ),
            Text('Lights/Reflectors'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isParkingChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isParkingChecked = newValue;
                });
              },
            ),
            Text('Parking Brake'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isBrakesChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isBrakesChecked = newValue;
                });
              },
            ),
            Text('Brakes'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isTiresChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isTiresChecked = newValue;
                });
              },
            ),
            Text('Tires'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isWheelsChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isWheelsChecked = newValue;
                });
              },
            ),
            Text('Wheels/Rims'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isEmergencyChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isEmergencyChecked = newValue;
                });
              },
            ),
            Text('Emergency Equipment'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isRegistrationChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isRegistrationChecked = newValue;
                });
              },
            ),
            Text('Registration/Tags Expired'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isAnnualChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isAnnualChecked = newValue;
                });
              },
            ),
            Text('Annual Inspection Expired'),
          ],
        ),
        new Row(
          children: <Widget>[
            new Checkbox(
              value: isOilChecked,
              onChanged: (bool newValue) {
                setState(() {
                  isOilChecked = newValue;
                });
              },
            ),
            Text('Oil Change Needed'),
          ],
        ),
        new Divider(),
        TextField(
          style:
              TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
          controller: otherIssuesController,
          decoration: InputDecoration(
            labelText: 'Other Issues',
            labelStyle: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    ));
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
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).accentColor),
              controller: odometerController,
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
