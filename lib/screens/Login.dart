
import 'package:ecommerse/screens/choose.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class XD_Login extends StatelessWidget {

  String email;
  String password;
  String type;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        key: scaffoldKey,
        
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          
          child: ListView(
                      
              children: <Widget>[
              
                SizedBox(
                  width: 86.0,
                  height: 40.0,
                  child: SingleChildScrollView(
                      child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Segoe UI Emoji',
                      fontSize: 29,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  )),
                ),
              SizedBox(height: 20,),  Form(
                key: formKey,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email"),
                       validator: (val) => val.length == 0 ? "Enter Email" : null,
                  onSaved: (val) => this.email = val,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password" ),
                       validator: (val) => val.length == 0 ? "Enter Password" : null,
                  onSaved: (val) => this.password = val,
                    ),
                    SizedBox(height: 20,),
                     TextFormField(
                    
                      decoration: InputDecoration(labelText: "Type" ),
                       validator: (val) => val.length == 0 ? "Enter Type" : null,
                  onSaved: (val) => this.type = val,
                    ),
                    SizedBox(height: 50,),
                    RaisedButton(
                       padding: EdgeInsets.fromLTRB(50, 5, 50, 5),

                      color: Colors.blue,
                      onPressed: () {
                         if (this.formKey.currentState.validate()) {
                        formKey.currentState.save();
                      }
                      if (type == "client") {
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
                            builder: (context) => productList()),(route)=> false);
                      }else{
                      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
                            builder: (context) => choose()),(route)=> false);
                      }
                      
                     
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                              
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                      ),
                    ),
                     FlatButton(
                       padding: EdgeInsets.fromLTRB(50, 5, 50, 5),

                      onPressed: () {},
                      child: Text(
                        "Do not have an account? SignUp",
                        style: TextStyle(
                              
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        );
  }
}
