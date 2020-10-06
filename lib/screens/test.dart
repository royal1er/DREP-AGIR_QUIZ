import 'package:flutter/material.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:path/path.dart';

import 'home_page.dart';

class CardForm extends StatefulWidget {
  @override
  CardFormState createState() => CardFormState();


}

class CardFormState extends State<CardForm> {
  CardFormState({Key key, this.name, this.firstName, this.function});
  String name = "Test";
  String firstName = " ";
  String function = " ";

  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    this.name = name;
  }

  String getNom() {
    if(this.name != null){
      print(this.name);
      return this.name;
    }if(this.name == null){
      print(this.name);
      return "TSET";
    }
    else{
      print(this.name);
      return "TEST";
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon profil"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (text) {
                    setState(() {
                      name = text;
                    });
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (text) {
                    setState(() {
                      firstName = text;
                    });
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (text) {
                    setState(() {
                      function = text;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {

                      });
//                      // Validate returns true if the form is valid, or false
//                      // otherwise.
//                      if (_formKey.currentState.validate()) {
//                        // If the form is valid, display a Snackbar.
//                        Scaffold.of(context)
//                            .showSnackBar(SnackBar(content: Text('Processing Data')));
//                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

