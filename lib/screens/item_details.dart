import 'dart:async';

import 'package:ecommerse/models/note.dart';
import 'package:ecommerse/models/order.dart';
import 'package:ecommerse/screens/AddressList.dart';

import 'package:ecommerse/utils/database_helper.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';


class ItemDetail extends StatefulWidget {

	final String appBarTitle;
	final Note note;

	ItemDetail(this. note, this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<ItemDetail> {


	DatabaseHelper helper = DatabaseHelper();

	String appBarTitle;
  Order order;
	Note note;

	TextEditingController titleController = TextEditingController();
	TextEditingController descriptionController = TextEditingController();
	TextEditingController priceController = TextEditingController();

	NoteDetailState(this.note, this.appBarTitle);

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = Theme.of(context).textTheme.title;

		titleController.text = note.title;
		descriptionController.text = note.description;
    priceController.text =note.price;

    return WillPopScope(

	    onWillPop: () {
	    	// Write some code to control things, when user press Back navigation button in device navigationBar
		    moveToLastScreen();
	    },

	    child: Scaffold(
	    appBar: AppBar(
		    title: Text(appBarTitle),
		    leading: IconButton(icon: Icon(
				    Icons.arrow_back),
				    onPressed: () {
		    	    // Write some code to control things, when user press back button in AppBar
		    	    moveToLastScreen();
				    }
		    ),
	    ),

	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[

			  Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                            image: DecorationImage(image: AssetImage('images/img2.jpg'), fit: BoxFit.cover),
                          ),
                        ),

				 

				    // Third Element
				    Center(
				      child: Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Text("name : "+this.note.title, style: textStyle,),
					    ),
				    ),
				     Center(
				       child: Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Text("price : "+this.note.price, style: textStyle,),
					    ),
				     ),
              Center(
                child: Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Text("Description : "+this.note.description, style: textStyle,),
					    ),
              ),
            

				    // Fourth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Buy Now',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
                        
                        print(order);
									    	setState(() {
									    	  debugPrint("Save button clicked");
                          _showAlertDialog("ADD Order","Your order added succsfully");

                      
									    	});

                     
                        
									    },
								    ),
							    ),

							    Container(width: 5.0,),


						    ],
					    ),
				    ),

			    ],
		    ),
	    ),

    ));
  }

  void moveToLastScreen() {
		Navigator.pop(context, true);
  }

 void navigateToDetail(Note note, String title) async {
	  bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
		  return AddressList();
	  }));

	 
  }




	void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
     navigateToDetail(note, "title");


	}

  
  

}










