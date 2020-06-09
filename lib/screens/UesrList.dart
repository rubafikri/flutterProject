
import 'package:ecommerse/models/product.dart';
import 'package:ecommerse/utils/database.dart';
import 'package:flutter/material.dart';

import 'dart:async';




Future<List<product>> fetchEmployeesFromDatabase() async {
  var dbHelper = DBHelper();
  Future<List<product>> pro = dbHelper.getProducts();
  return pro;
}

class MyEmployeeList extends StatefulWidget {
  @override
  MyEmployeeListPageState createState() => new MyEmployeeListPageState();
}

class MyEmployeeListPageState extends State<MyEmployeeList> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Employee List'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<product>>(
          future: fetchEmployeesFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new  ListView.builder(

                itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    snapshot.data[index].name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                   Text(
                    snapshot.data[index].price,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                      child: Image.asset(
                    'images/man.jpg',
                    height: 16,
                  ))
                ],
              ),
            ),
            for (int i = 0; i < 5; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFE6E6E6)),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                            image: DecorationImage(image: AssetImage('images/img$i.jpg'), fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFF7D59EE),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text('9.1'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Iceland - 6D 5N',
                                style: TextStyle(color: Color(0xFF2A2A2A)),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Complete Guided Tour',
                                style: TextStyle(color: Color(0xFFA9A9BA), fontSize: 11.5),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            '\$2,250',
                            style: TextStyle(color: Color(0xFF2A2A2A), fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ];
                  });
            } else if (snapshot.data.length == 0) {
              return new Text("No Data found");
            }
            return new Container(alignment: AlignmentDirectional.center,child: new CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}