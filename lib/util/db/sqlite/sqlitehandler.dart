import 'package:sqflite/sqflite.dart';
import 'dart:core';
import '../../../models/compte.dart';
import '../../../models/typeCompte.dart';
import '../../../models/informations.dart';
import '../../../models/typeInformation.dart';
import '../../../models/user.dart';
import '../../../models/wear.dart';
import '../../../models/todolist.dart';

// User sqlUser = new User();

// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';
class SqlHandler {
  static final SqlHandler _instanceOfSqliteHandler = new SqlHandler.internal();
  factory SqlHandler() => _instanceOfSqliteHandler;
  static Database _db;
  SqlHandler.internal();
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  //static var db;
  initDb() async {
    String databasePath = await getDatabasesPath();
    // String path=myjoin(databasePath,"scarydb");
    String path = databasePath.toString() + "/scarydb";
    String path2 = path.toString();
    print(path2);
    var db = await openDatabase(path2, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int dbVersion) async {
    Compte compte = new Compte();
    Information info = new Information();
    TodoList todoList = new TodoList();
    TypeCompte typeCompte = new TypeCompte();
    TypeInformation typeInformation = new TypeInformation();
    // User user = new User();
    // Wear wear = new Wear();

    await db.execute("" +
        "CREATE TABLE typeAccount(refTypeAccount TEXT PRIMARY KEY, nameTypeAccount TEXT); " +
        "CREATE TABLE typeInformation(refTypeInformation TEXT PRIMARY KEY, nameTypeInfo TEXT, status INT);" +
        "CREATE TABLE wear(refWear TEXT PRIMARY KEY, sizeWear INTEGER, colorWear TEXT, assignedWear INTEGER);" +
        "CREATE TABLE Account(refAccount TEXT PRIMARY KEY, nameAccount TEXT, refTypeAccount TEXT, FOREIGN KEY(refTypeAccount) REFERENCES typeAccount(refTypeAccount) );" +
        "CREATE TABLE information(refInformation TEXT PRIMARY KEY, nameInformation TEXT, article TEXT, refTypeInfo TEXT, FOREIGN KEY(refTypeInfo) REFERENCES typeInformation(refTypeInformation));" +
        "CREATE TABLE user(refUser TEXT PRIMARY KEY, fName TEXT, lName TEXT, email TEXT, pic TEXT, refAccount TEXT, refWear TEXT, refTypeInformation TEXT,   FOREIGN(refTypeInformation) REFERENCES typeInformation(refTypeInformation),   FOREIGN(refWear) REFERENCES wear(refWear),   FOREIGN(refAccount) REFERENCES Account(refAccount));" +
        "CREATE TABLE usertest(refUser TEXT PRIMARY KEY, fName TEXT, lName TEXT, email TEXT, pic TEXT, refAccount TEXT, refWear TEXT, refTypeInformation TEXT);" +
        "CREATE TABLE todoList(refTodoList TEXT PRIMARY KEY, aim TEXT, dateCreated TEXT, dateRemind TEXT, refUser)");

    //Create an user
  }

  Future closeCon() async {
    var dbClient = await db;
    return dbClient.close();
  }

  /*******************************
   *CRUD Methods*****************
   ******************************/

  final String _usertablename = "usertest";
  // final String _usertablename = "user";
  final String _usercolumnid = "refUser";
  final String _userfName = "fName";
  final String _userlName = "lName";
  final String _userEmail = "email";
  final String _userPic = "pic";
  final String _userRefAccount = "refAccount";
  final String _userRefWear = "refWear";
  final String _userRefTypeInformation = "refTypeInformation";
  final String _userPassword = "password";

//Save new user
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    var result = await dbClient.insert(_usertablename, user.toMap());

    return result;
  }

  Future<List> getAllUsers() async {
    var dbClient = await SqlHandler().db;
    var result = await dbClient.query(_usertablename, columns: [
      _usercolumnid,
      _userfName,
      _userlName,
      _userEmail,
      _userPic,
      _userRefAccount,
      _userRefWear,
      _userRefTypeInformation
    ]);
    return result.toList();
  }

//Get a single user

  Future<User> getUser(String refUser) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(_usertablename,
        columns: [
          _usercolumnid,
          _userfName,
          _userlName,
          _userEmail,
          _userPic,
          _userRefAccount,
          _userRefWear,
          _userRefTypeInformation
        ],
        where: '$_usercolumnid = ?',
        whereArgs: [refUser]);
    if (result.length > 0) {
      return new User.fromMap(result.first);
    }
    return null;
  }

  Future<bool> loginUser(String email, String password) async {
    var dbClient = await db;
    List<Map> result = await dbClient.rawQuery(
        'SELECT * FROM $_usertablename where $_userEmail = $email and $_userPassword = $password');
    if (result.length > 0) {
      return true;
    }
    return false;
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;

    return await dbClient.update(_usertablename, user.toMap(),
        where: "$_usercolumnid = ?", whereArgs: [user.refUser]);
  }

  Future<int> deleteUSer(String refUser) async {
    var dbClient = await SqlHandler().db;
    return await dbClient.delete(_usertablename,
        where: "$_usercolumnid=?", whereArgs: [refUser]);
  }

/**********************
***********************
***End CRUD Methods****
***********************/

}
