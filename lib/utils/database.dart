import 'dart:async';
import 'dart:io' as io;
import 'package:ecommerse/models/User.dart';
import 'package:ecommerse/models/product.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "User.db");
    var theDb = await openDatabase(path, version: 2, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
    "CREATE TABLE User(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, mobileno TEXT,emailId TEXT )");

     db.execute(
    '''CREATE TABLE Product(id INTEGER PRIMARY KEY, name TEXT, price TEXT, cat TEXT,desc TEXT )''');
    print("Created tables");
  }
  
  // Retrieving employees from Employee Tables
  Future<List<User>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<User> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(new User(list[i]["firstname"], list[i]["lastname"], list[i]["mobileno"], list[i]["emailid"]));
    }
    print(employees.length);
    return employees;
  }


   Future<List<product>> getProducts() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Product');
    List<product> pro = new List();
    for (int i = 0; i < list.length; i++) {
      pro.add(new product(list[i]["name"], list[i]["price"], list[i]["cat"], list[i]["desc"]));
    }
    print(pro.length);
    return pro;
  }
  
  void saveEmployee(User user) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO User(firstname, lastname, mobileno, emailid ) VALUES(' +
              '\'' +
              user.name +
              '\'' +
              ',' +
              '\'' +
              user.email +
              '\'' +
              ',' +
              '\'' +
              user.password +
              '\'' +
              ',' +
              '\'' +
              user.type +
              '\'' +
              ')');
    });
  }

void saveProducts(product pro) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Product(name, price, cat, desc ) VALUES(' +
              '\'' +
              pro.name +
              '\'' +
              ',' +
              '\'' +
              pro.price +
              '\'' +
              ',' +
              '\'' +
              pro.cat +
              '\'' +
              ',' +
              '\'' +
              pro.desc +
              '\'' +
              ')');
    });
    print("added");
  }

}