import 'package:ecommerse/screens/adminOrder.dart';
import 'package:ecommerse/screens/note_list.dart';
import 'package:ecommerse/screens/userOrder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Order.dart';

class choose extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
          child:
             
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                    elevation: 10,
                    child: Text(
                      'Add Product',
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
                          MaterialPageRoute(builder: (context) => NoteList()));
                    },
                  ),
                   RaisedButton(
                elevation: 10,
                child: Text(
                  'Orders',
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
                      MaterialPageRoute(builder: (context) => AdminOrder()));
                },
              ),
                ],
              ),
            
             
            
          ),
        );
  }
}
