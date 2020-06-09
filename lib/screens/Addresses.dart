import 'dart:async';
import 'package:ecommerse/models/Address.dart';
import 'package:ecommerse/models/Address.dart';
import 'package:ecommerse/models/Address.dart';
import 'package:ecommerse/models/order.dart';
import 'package:ecommerse/utils/database_helper.dart';
import 'package:flutter/material.dart';


class AddressDetail extends StatefulWidget {

	final String appBarTitle;
	final Address address;

	AddressDetail(this. address, this.appBarTitle );

	@override
  State<StatefulWidget> createState() {

    return AddressDetailState(this.address, this.appBarTitle );
  }
}

class AddressDetailState extends State<AddressDetail> {


	DatabaseHelper helper = DatabaseHelper();

	String appBarTitle;
	Address address;


	TextEditingController titleController = TextEditingController();
	TextEditingController descriptionController = TextEditingController();
	TextEditingController priceController = TextEditingController();

	AddressDetailState(this.address, this.appBarTitle);

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = Theme.of(context).textTheme.title;

		titleController.text = address.name;
		descriptionController.text = address.addressLine;
    priceController.text =address.city;

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

			  

				    // Second Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: titleController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in Title Text Field');
						    	updateTitle();
						    },
						    decoration: InputDecoration(
							    labelText: 'Name',
							    labelStyle: textStyle,
							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),

				    // Third Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: descriptionController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateDescription();
						    },
						    decoration: InputDecoration(
								    labelText: 'Address Line',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),
            Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: priceController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in price Text Field');
                  updatePrice();

						    },
						    decoration: InputDecoration(
								    labelText: 'City',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
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
										    'Save',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Save button clicked");
									    	  _save();
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

	// Convert the String priority in the form of integer before saving it to Database


	// Convert int priority to String priority and display it to user in DropDown


	// Update the title of Address object
  void updateTitle(){
    address.name = titleController.text;
  }
  void updatePrice(){
    address.addressLine = priceController.text;
  }

	// Update the description of Address object
	void updateDescription() {
		address.city = descriptionController.text;
	}

	// Save data to database
	void _save() async {

		moveToLastScreen();

		int result;
		if (address.id != null ) {  // Case 1: Update operation
			result = await helper.updateAdd(address);

		} else { // Case 2: Insert Operation
			result = await helper.insertAdd(address);

		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Address Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Address');
		}

	}

	void _delete() async {

		moveToLastScreen();

		// Case 1: If user is trying to delete the NEW Address i.e. he has come to
		// the detail page by pressing the FAB of AddressList page.
		if (address.id == null) {
			_showAlertDialog('Status', 'No Address was deleted');
			return;
		}

		// Case 2: User is trying to delete the old Address that already has a valid ID.
		int result = await helper.deleteAdd(address.id);
		if (result != 0) {
			_showAlertDialog('Status', 'Address Deleted Successfully');
		} else {
			_showAlertDialog('Status', 'Error Occured while Deleting Address');
		}
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
	}

}










