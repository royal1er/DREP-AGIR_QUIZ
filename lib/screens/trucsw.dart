import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_planner_app/dates_list.dart';


class Make_list extends StatefulWidget {
  @override
  _Make_list createState() => new _Make_list();


}


class _Make_list extends State<Make_list> {

  int i = 1;
  String valeur = "";
  bool on = false;


  @override
  Widget build(BuildContext context) {
    return new Material(

      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                                  i++;
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
                  title: Text(valeur),
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

              },
              child: Text(
                  'Valider',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          ],
        ),
      ),
    );
  }

}