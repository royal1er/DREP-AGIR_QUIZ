import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/screens/alarm.dart';
import 'profil.dart';

import 'package:flutter_task_planner_app/screens/calendar_page.dart';
import 'package:flutter_task_planner_app/screens/list.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_task_planner_app/widgets/task_column.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
import 'package:flutter_task_planner_app/main.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  String my_title(){
    return title;
  }
  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }
}

class _HomePage extends State<HomePage> {

  String get_title(){
    return get_title();
  }
//
//  CardFormState profiluser = new CardFormState();
  FormScreenState userForm = new FormScreenState();
  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();
  final TextEditingController fNameController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController functionController = new TextEditingController();

  void initState() {
    super.initState();
    nameController.text = 'Ton nom';
    fNameController.text = 'Ton prénom';
    functionController.text = "Etudiante";
  }

//  Future<String> user = userprofil.getNom();
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: AppBar(
          title: Text(widget.title),
        actions: <Widget>[
          Icon(Icons.search,
              color: LightColors.kDarkBlue, size: 25.0),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: LightColors.kDarkYellow,
              ),
            ),
            ListTile(
              title: Text('Agenda'),
              onTap: () {
                Navigator.push(
                    context,
                MaterialPageRoute(
                    builder: (context) => CalendarPage()
                )
                );
              },
            ),
            ListTile(
              title: Text('Todo List'),
              onTap: () {
                Navigator.push(
                    context,
                MaterialPageRoute(
                    builder: (context) => List()
                )
                );
              },
            ),
            ListTile(
              title: Text('Alarme'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AlarmState()
                    )
                );
              },
            ),
            ListTile(
              title: Text('Mon profil'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormScreen()
                    )
                );
              },
            ),
            ListTile(
              title: Text('Projet en cours'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kDarkYellow,
                            center: CircleAvatar(
                              backgroundColor: LightColors.kBlue,
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                'assets/images/avatar_f.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                  child:
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return AlertDialog(
                                              title: Form(
                                                key: _keyDialogForm,
                                                child: Column(
                                                  children: <Widget>[
                                                    TextFormField(
                                                      decoration: const InputDecoration(
                                                        icon: Icon(Icons.ac_unit),
                                                      ),
                                                      maxLength: 8,
                                                      textAlign: TextAlign.center,
                                                      onSaved: (val) {
                                                        nameController.text = val;
                                                        setState(() {});
                                                      },
                                                      autovalidate: true,
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Modifier votre prénom';
                                                        }

                                                        return null;
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    if (_keyDialogForm.currentState.validate()) {
                                                      _keyDialogForm.currentState.save();

                                                      Navigator.pop(context);
                                                    }

                                                  },

                                                  child: Text('Save'),
                                                  color: Colors.blue,
                                                ),
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Cancel')),
                                              ],
                                            );
                                          }
                                      );
                                    },
                                    child: Text(
                                      nameController.text,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: LightColors.kDarkBlue,
                                        fontWeight: FontWeight.w800,
                                      ),

                                    ),
                                  )

                              ),
                              Container(
                                child:
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                          return AlertDialog(
                                            title: Form(
                                              key: _keyDialogForm,
                                              child: Column(
                                                children: <Widget>[
                                                  TextFormField(
                                                    decoration: const InputDecoration(
                                                      icon: Icon(Icons.ac_unit),
                                                    ),
                                                    maxLength: 8,
                                                    textAlign: TextAlign.center,
                                                    onSaved: (val) {
                                                      fNameController.text = val;
                                                      setState(() {});
                                                    },
                                                    autovalidate: true,
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Modifier votre prénom';
                                                      }

                                                      return null;
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () {
                                                  if (_keyDialogForm.currentState.validate()) {
                                                    _keyDialogForm.currentState.save();

                                                    Navigator.pop(context);
                                                  }

                                                },

                                                child: Text('Save'),
                                                color: Colors.blue,
                                              ),
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel')),
                                            ],
                                          );
                                        }
                                      );
                                    },
                                    child: Text(
                                      fNameController.text,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: LightColors.kDarkBlue,
                                        fontWeight: FontWeight.w800,
                                      ),

                                    ),
                                  )

                              ),
                              Container(
                                  child:
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context){
                                            return AlertDialog(
                                              title: Form(
                                                key: _keyDialogForm,
                                                child: Column(
                                                  children: <Widget>[
                                                    TextFormField(
                                                      decoration: const InputDecoration(
                                                        icon: Icon(Icons.ac_unit),
                                                      ),
                                                      maxLength: 8,
                                                      textAlign: TextAlign.center,
                                                      onSaved: (val) {
                                                        functionController.text = val;
                                                        setState(() {});
                                                      },
                                                      autovalidate: true,
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return 'Modifier votre statut actuel';
                                                        }

                                                        return null;
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    if (_keyDialogForm.currentState.validate()) {
                                                      _keyDialogForm.currentState.save();

                                                      Navigator.pop(context);
                                                    }

                                                  },

                                                  child: Text('Save'),
                                                  color: Colors.blue,
                                                ),
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Cancel')),
                                              ],
                                            );
                                          }
                                      );
                                    },
                                    child: Text(
                                      functionController.text,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: LightColors.kDarkBlue,
                                        fontWeight: FontWeight.w800,
                                      ),

                                    ),
                                  )

                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Mes Tâches'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: LightColors.kRed,
                            title: 'To Do',
                            subtitle: '5 tasks now. 1 started',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.kDarkYellow,
                            title: 'En progrès',
                            subtitle: '1 tasks now. 1 started',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: LightColors.kBlue,
                            title: 'Fait',
                            subtitle: '18 tasks now. 13 started',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Mes TodoLists'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => List()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          subheading('Projets en cours'),
                          SizedBox(height: 5.0),

                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kGreen,
                                loadingPercent: 0.25,
                                title: 'Medical App',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.6,
                                title: 'Making History Notes',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kDarkYellow,
                                loadingPercent: 0.45,
                                title: 'Sports App',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kBlue,
                                loadingPercent: 0.9,
                                title: 'Online Flutter Course',
                                subtitle: '23 hours progress',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
