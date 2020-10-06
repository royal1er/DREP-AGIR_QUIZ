import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class AlarmState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AlarmState();

  }


}

class _AlarmState extends State<AlarmState>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarme"),
      ),
      body: new Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AnalogClock(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.black),
                    color: Colors.transparent,
                    shape: BoxShape.circle),
                width: 150.0,
                height: 150.0,
                isLive: true,
                hourHandColor: Colors.black,
                minuteHandColor: Colors.black,
                showSecondHand: true,
                numberColor: Colors.black87,
                secondHandColor: Colors.red,
                showNumbers: true,
                textScaleFactor: 1.4,
                showTicks: true,
                showDigitalClock: true,
                datetime: DateTime(2019, 1, 1, 9, 12, 15),
              ),
//              RaisedButton(
//                child: new Text("Bonjour"),
//                onPressed: () {},
//              ),
              Row(
                children: <Widget>[
                  Text('Mes alarmes'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}