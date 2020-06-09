import 'dart:async';
import 'package:ecommerse/models/Address.dart';
import 'package:ecommerse/utils/database_helper.dart';
import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import 'Addresses.dart';



class AddressList extends StatefulWidget {

	@override
  State<StatefulWidget> createState() {

    return AddressListState();
  }
}

class AddressListState extends State<AddressList> {

	DatabaseHelper databaseHelper = DatabaseHelper();
	List<Address> addressList;
	int count = 0;

	@override
  Widget build(BuildContext context) {

		if (addressList == null) {
			addressList = List<Address>();
			updateListView();
		}

    return Scaffold(

	    appBar: AppBar(
		    title: Text('Products'),
	    ),

	    body: getAddressListView(),

	    floatingActionButton: FloatingActionButton(
		    onPressed: () {
		      debugPrint('FAB clicked');
		      navigateToDetail(Address("","","","",""), 'Add Address');
		    },

		    tooltip: 'Add Product',

		    child: Icon(Icons.add),

	    ),
    );
  }

  ListView getAddressListView() {

		TextStyle titleStyle = Theme.of(context).textTheme.subhead;

		return ListView.builder(
			itemCount: count,
			itemBuilder: (BuildContext context, int position) {
				return Card(
					color: Colors.white,
					elevation: 2.0,
					child: ListTile(

					
						title: Text(this.addressList[position].name, style: titleStyle,),


						trailing: GestureDetector(
							child: Icon(Icons.delete, color: Colors.grey,),
							onTap: () {
								_delete(context, addressList[position]);
							},
						),


						onTap: () {
							debugPrint("ListTile Tapped");
							navigateToDetail(this.addressList[position],'Edit Address');
						},

					),
				);
			},
		);
  }

  // Returns the priority color
	Color getPriorityColor(int priority) {
		switch (priority) {
			case 1:
				return Colors.red;
				break;
			case 2:
				return Colors.yellow;
				break;

			default:
				return Colors.yellow;
		}
	}

	

	void _delete(BuildContext context, Address address) async {

		int result = await databaseHelper.deleteAdd(address.id);
		if (result != 0) {
			_showSnackBar(context, 'Address Deleted Successfully');
			updateListView();
		}
	}

	void _showSnackBar(BuildContext context, String message) {

		final snackBar = SnackBar(content: Text(message));
		Scaffold.of(context).showSnackBar(snackBar);
	}

  void navigateToDetail(Address address, String title) async {
	  bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
		  return AddressDetail(address, title);
	  }));

	  if (result == true) {
	  	updateListView();
	  }
  }

  void updateListView() {

		final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<Address>> addressListFuture = databaseHelper.getAddList();
			addressListFuture.then((addressList) {
				setState(() {
				  this.addressList = addressList;
				  this.count = addressList.length;
				});
			});
		});
  }
}







