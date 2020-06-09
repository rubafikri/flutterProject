
import 'package:ecommerse/screens/Login.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

class XD_Main2 extends StatelessWidget {
  XD_Main2({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 202.0,
                height: 104.0,
                child: SingleChildScrollView(
                    child: Text(
                  'Welcome to our App',
                  style: TextStyle(
                    fontFamily: 'Segoe UI Emoji',
                    fontSize: 29,
                    color: const Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
              Center(
                child: Container(
                  width: 297.0,
                  height: 227.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    image: DecorationImage(
                      image: const AssetImage('images/com.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                elevation: 10,
                child: Text(
                  'Log in ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 26,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => XD_Login()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                elevation: 10,
                child: Text(
                  'Sign Up ',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 26,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => XD_SignUp()));
                },
              ),
            ],
          ),
        ));
  }
}
