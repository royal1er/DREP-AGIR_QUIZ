import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new
    _CalendarPage();
  }
}

class _CalendarPage extends State<CalendarPage>{
  CalendarController _controller;
  Map<DateTime,List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime,List<dynamic>>.from(decodeMap(jsonDecode(prefs.getString('events') ?? "{}")));
    });
  }
  Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map){
    Map<String,dynamic> newMap = {};
    map.forEach((key,value){
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime,dynamic> decodeMap(Map<String,dynamic> map){
    Map<DateTime,dynamic> newMap = {};
    map.forEach((key,value){
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events){
                setState(() {
                  _selectedEvents = events;
                });
              },
//              builders: CalendarBuilders(
////                selectedDayBuilder: (context,date,events) => Text
////                  (date.day.toString())
////              ),
              calendarController: _controller,
              ),
            ... _selectedEvents.map((event) => ListTile(
              title: Text(event),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      )

    );
  }
  _showAddDialog(){
    showDialog(
        context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Save"),
            onPressed: (){
              //6:48
              if(_eventController.text.isEmpty) return;
              setState(() {
              if(_events[_controller.selectedDay] != null){
                _events[_controller.selectedDay].add(_eventController.text);
              }else{
                _events[_controller.selectedDay] = [_eventController.text];
              }
              prefs.setString('events', json.encode(encodeMap(_events)));
              _eventController.clear();
              Navigator.pop(context);
              });
            },
          )
        ],
      )
    );
  }
}
