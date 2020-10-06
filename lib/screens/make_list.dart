

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_planner_app/dates_list.dart';
import 'package:flutter_task_planner_app/screens/Dog.dart';



class Make_list extends StatefulWidget {
  @override
  _Make_list createState() => new _Make_list();


}


class _Make_list extends State<Make_list> {

  int i = 1;
  int n = 0;
  String valeur = "";
  static var valuetitle = "";
  bool on = false;
  var listvalue = ["fjg"];
  var encoded = json.encode([{"title": valuetitle}]);
  var decoded = json.decode('["foo", { "bar": 499 }]');
  Dog list;


  @override
  Widget build(BuildContext context) {
    return new Material(


      child: Center(


        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Text("Ma tâche",
          style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2),
        ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300, 60)),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.add),
                        labelText: 'Saisissez le nom de vôtre tâche',
                      ),
                      onSaved: (String value) {
                        print('Value for field saved as "$value"');
                        setState(() {
                        });
                      },
                      onFieldSubmitted: (value){
                        print('Value for field saved as "$value"');
                        setState(() {
                          valuetitle = value;
                        });
                      },

                    ),
                  ),
                ),
              ],
            ),
            Shortcuts(
              shortcuts: <LogicalKeySet, Intent>{
                // Pressing enter on the field will now move to the next field.
                LogicalKeySet(LogicalKeyboardKey.enter):
                Intent(NextFocusAction.key),
              },
              child: DefaultFocusTraversal(
                child: Form(
                  autovalidate: true,
                  onChanged:() {
                    Form.of(primaryFocus.context).deactivate();
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tight(Size(200, 50)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.add),
                              labelText: 'Tâche',
                            ),
                            onSaved: (String value) {
                              print('Value for field saved as "$value"');
                              setState(() {
                              });
                            },
                            onFieldSubmitted: (value){
                              print('Value for field saved as "$value"');
                              setState(() {
                                valeur = value;
                                listvalue.add(value);
                                i++;
                                n++;
                                print(listvalue);
                                list.toString();
                              });
                            },

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Wrap(
                children:List<Widget>.generate(i, (int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(Size(200, 50)),
                          child: CheckboxListTile(
                              title: Text(listvalue[index]),
                              value: on,
                              onChanged: (bool value){
                                setState(() {
                                  on = value;
                                });
                              })
                      )
                  );
                })),
            RaisedButton(
              onPressed: (){
                setState(() {

                });

              },
              child: Text(
                  'Valider',
                  style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

}