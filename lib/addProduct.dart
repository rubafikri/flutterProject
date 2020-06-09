import 'package:ecommerse/choose.dart';
import 'package:ecommerse/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class AddProduct extends StatelessWidget{


   String name;
  String price;
  String cat;
  String desc;

  	AddProduct(this. name, this.price);

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
          child: new Column(
            children: [
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: 'Name'),
                validator: (val) => val.length == 0 ? "Enter Name" : null,
                onSaved: (val) => this.name = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: 'Price'),
                validator: (val) => val.length == 0 ? 'Enter Price' : null,
                onSaved: (val) => this.price = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(labelText: 'cat'),
                validator: (val) => val.length == 0 ? 'Enter cat' : null,
                onSaved: (val) => this.cat = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(labelText: 'desc'),
                validator: (val) => val.length == 0 ? 'Enter desc' : null,
                onSaved: (val) => this.desc = val,
              ),
              new Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  onPressed: () {
                    if (this.formKey.currentState.validate()) {
                      formKey.currentState.save();
                    }
                  
                      var pro = product(name, price, cat, desc);
                      var dbHelper = DBHelper();
                      dbHelper.saveProducts(pro);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => choose()));
                  
                    
                   
                  },
                  child: new Text('Add Products'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}