import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String name;
  String firstname;


  FormScreenState({Key key, this.name,this.firstname});
  //  String _password;
//  String _url;
//  String _phoneNumber;
//  String _calories;



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Entre ton nom';
        }

        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget _buildFirstname() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Entre ton prénom';
        }
        return null;
      },
      onSaved: (String value) {
        firstname = value;
      },
    );
  }

//  Widget _buildPassword() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Password'),
//      keyboardType: TextInputType.visiblePassword,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Password is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _password = value;
//      },
//    );
//  }
//
//  Widget _builURL() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Url'),
//      keyboardType: TextInputType.url,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'URL is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _url = value;
//      },
//    );
//  }
//
//  Widget _buildPhoneNumber() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Phone number'),
//      keyboardType: TextInputType.phone,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Phone number is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _url = value;
//      },
//    );
//  }
//
//  Widget _buildCalories() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Calories'),
//      keyboardType: TextInputType.number,
//      validator: (String value) {
//        int calories = int.tryParse(value);
//
//        if (calories == null || calories <= 0) {
//          return 'Calories must be greater than 0';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _calories = value;
//      },
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Demo")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildFirstname(),
//              _buildPassword(),
//              _builURL(),
//              _buildPhoneNumber(),
//              _buildCalories(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  print(name);
                  print(firstname);

                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}