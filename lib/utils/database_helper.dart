import 'package:ecommerse/models/Address.dart';
import 'package:ecommerse/models/note.dart';
import 'package:ecommerse/models/order.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String noteTable = 'product_table';
	String colId = 'id';
	String colTitle = 'title';
	String colDescription = 'description';
  	String colPrice = 'price';
    
	String orderTable = 'order_table';
	String colId1 = 'orderid';
	String colTitle1 = 'ordertitle';
	String colDescription1 = 'orderdescription';
  String colPrice1 = 'orderprice';


	String addTable = 'Address_table';
	String colId2 = 'id';
	String colName2 = 'name';
	String colAddressLines = 'addressLine';
  String colcity  = 'city';
  String colportalCode = 'orderportalCode';
  String colphoneNumber = 'orderphoneNumber';


	   

	DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

	Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'main.db';

		// Open/create the database at a given path
		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return notesDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
				'$colDescription TEXT , $colPrice TEXT)');

        await db.execute('CREATE TABLE $orderTable($colId1 INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle1 TEXT, '
				'$colDescription1 TEXT , $colPrice1 TEXT)');

         await db.execute('CREATE TABLE $addTable($colId2 INTEGER PRIMARY KEY AUTOINCREMENT, $colName2 TEXT, '
				'$colAddressLines TEXT , $colcity TEXT)');
	}

	// Fetch Operation: Get all note objects from database
	Future<List<Map<String, dynamic>>> getNoteMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(noteTable, orderBy: '$colDescription ASC');
		return result;
	}

	// Insert Operation: Insert a Note object to database
	Future<int> insertNote(Note note) async {
		Database db = await this.database;
		var result = await db.insert(noteTable, note.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateNote(Note note) async {
		var db = await this.database;
		var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteNote(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
		return result;
	}

	// Get number of Note objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<Note>> getNoteList() async {

		var noteMapList = await getNoteMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<Note> noteList = List<Note>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(Note.fromMapObject(noteMapList[i]));
		}

		return noteList;
	}


Future<List<Map<String, dynamic>>> getOrderMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(orderTable, orderBy: '$colDescription1 ASC');
		return result;
	}

	// Insert Operation: Insert a Note object to database
	Future<int> insertOrder(Order order) async {
		Database db = await this.database;
		var result = await db.insert(orderTable, order.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateOrder(Order order) async {
		var db = await this.database;
		var result = await db.update(orderTable, order.toMap(), where: '$colId1 = ?', whereArgs: [order.id]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteOrder(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $orderTable WHERE $colId1 = $id');
		return result;
	}

	// Get number of Note objects in database
	Future<int> getOrderCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $orderTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<Order>> getOrderList() async {

		var orderMapList = await getOrderMapList(); // Get 'Map List' from database
		int count = orderMapList.length;         // Count the number of map entries in db table

		List<Order> noteList = List<Order>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(Order.fromMapObject(orderMapList[i]));
		}

		return noteList;
	}



  	// Fetch Operation: Get all note objects from database
	Future<List<Map<String, dynamic>>> getAddressMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(addTable, orderBy: '$colName2 ASC');
		return result;
	}

	// Insert Operation: Insert a Note object to database
	Future<int> insertAdd(Address add) async {
		Database db = await this.database;
		var result = await db.insert(addTable, add.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> updateAdd(Address add) async {
		var db = await this.database;
		var result = await db.update(addTable, add.toMap(), where: '$colId2 = ?', whereArgs: [add.id]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> deleteAdd(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $addTable WHERE $colId2 = $id');
		return result;
	}

	// Get number of Note objects in database
	Future<int> getCount2() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $addTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<Address>> getAddList() async {

		var noteMapList = await getAddressMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<Address> noteList = List<Address>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(Address.fromMapObject(noteMapList[i]));
		}

		return noteList;
	}

}







