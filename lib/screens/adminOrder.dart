import 'dart:async';
import 'package:ecommerse/models/note.dart';
import 'package:ecommerse/screens/item_details.dart';
import 'package:ecommerse/utils/database_helper.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';




class AdminOrder extends StatefulWidget {

	@override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<AdminOrder> {

	DatabaseHelper databaseHelper = DatabaseHelper();
	List<Note> noteList;
	int count = 0;
  

	@override
  Widget build(BuildContext context) {

		if (noteList == null) {
			noteList = List<Note>();
			updateListView();
		}

    return Scaffold(
         appBar: AppBar(
          title: Text("Orders"),
            actions: <Widget>[
          Container(
            child: FlatButton(
              child: Icon(Icons.home),
              onPressed: () {
                              },
                            ),
                          ),
                        ],
                        ),
                
                      
                
                      body: getNoteListView(),
                
                    );
                  }
                
                  ListView getNoteListView() {
                
                    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
                
                    return ListView.builder(
                      itemCount: count,
                      itemBuilder: (BuildContext context, int position) {
                        return Container(
                           
                         
                          child: Column(
                            children: <Widget>[
                              Container(
                                          height: 160,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                                            image: DecorationImage(image: AssetImage('images/img2.jpg'), fit: BoxFit.cover),
                                          ),
                                        ),
                               
                              Card(
                          
                                color: Colors.white,
                                child: ListTile(
                          
                
                                  title: Text(this.noteList[position].title, style: titleStyle,),
                
                                  subtitle: Text(this.noteList[position].price),
                
                                  trailing: GestureDetector(
                                    child:  RaisedButton(child: Text("Details"),onPressed: (){
                                      navigateToDetail(this.noteList[position],'Order Details');
                                    })
                                  
                                  ),
                
                
                  
                
                                ),
                        
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                
                  
                
                
                  void navigateToDetail(Note note, String title) async {
                    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ItemDetail(note, title);
                    }));
                
                    if (result == true) {
                      updateListView();
                    }
                  }
                
                  void updateListView() {
                
                    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
                    dbFuture.then((database) {
                
                      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
                      noteListFuture.then((noteList) {
                        setState(() {
                          this.noteList = noteList;
                          this.count = noteList.length;
                        });
                      });
                    });
                  }
}