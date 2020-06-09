
import 'package:ecommerse/models/User.dart';
import 'package:ecommerse/screens/dashboard.dart';
import 'package:ecommerse/utils/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UesrList.dart';
import 'choose.dart';


class XD_SignUp extends StatelessWidget {
  String name;
  String email;
  String password;
  String type;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
     
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: ListView(
                      
              children: [
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Name'),
                  validator: (val) => val.length == 0 ? "Enter FirstName" : null,
                  onSaved: (val) => this.name = val,
                ),
                new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(labelText: 'Email'),
                  validator: (val) => val.length == 0 ? 'Enter Email' : null,
                  onSaved: (val) => this.email = val,
                ),
                new TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Password'),
                  validator: (val) => val.length == 0 ? 'Enter Password' : null,
                  onSaved: (val) => this.password = val,
                ),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: 'Type'),
                  validator: (val) => val.length == 0 ? 'Enter Type' : null,
                  onSaved: (val) => this.type = val,
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: new RaisedButton(
                    onPressed: () {
                      if (this.formKey.currentState.validate()) {
                        formKey.currentState.save();
                      }
                      if (type == "client") {
                        var user = User(name, email, password, type);
                        var dbHelper = DBHelper();
                        dbHelper.saveEmployee(user);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => productList()));
                      }else{
                        var user = User(name, email, password, type);
                      var dbHelper = DBHelper();
                      dbHelper.saveEmployee(user);
                       Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => choose()));
                      }
                     
                    },
                    child: new Text('Sign In'),
                  ),
                )
              ],
            ),
          ),
        ),
      
    );
  }


  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
}
