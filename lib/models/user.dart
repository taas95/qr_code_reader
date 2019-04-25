import 'package:sqflite/sql.dart';
import '../util/db/sqlite/sqlitehandler.dart';

class User {
  String _refUser;
  String _lName;
  String _fName;
  String _pic;
  String _refCompte;
  String _refWear;
  String _refTypeInformation;
  String _email;
  String _pwd;

  //Table define
  final String tablename = "user";
  final String columnid = "refUser";
  final String column_2 = "fName";
  final String column_3 = "lName";
  final String column_4 = "email";
  final String column_5 = "pic";
  final String column_6 = "refAccount";
  final String column_7 = "refWear";
  final String column_8 = "refTypeInformation";
  final String column_9 = "pwd";
  //Constructor
  User(this._refUser, this._refCompte, this._fName, this._lName, this._pic,
      this._refTypeInformation, this._email, this._refWear,this._pwd);

  User.map(dynamic obj) {
    this._refUser = obj['refUser'];
    this._refCompte = obj['refCompte'];
    this._fName = obj['fName'];
    this._lName = obj['lName'];
    this._pic = obj['pic'];
    this._email = obj['email'];
    this._refWear = obj['refWear'];
    this._refTypeInformation = obj['refTypeInformation'];
  }
//Getters
  String get refUser => _refUser;
  String get lName => _lName;
  String get fName => _fName;
  String get pic => _pic;
  String get refCompte => _refCompte;
  String get refWear => refWear;
  String get refTypeInformation => _refTypeInformation;
  String get email => _email;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (refUser != null) {
      map['refUser'] = _refUser;
    }
    map['refCompte'] = _refCompte;
    map['fName'] = _fName;
    map['lName'] = _lName;
    map['pic'] = _pic;
    map['email'] = _email;
    map['refWear'] = _refWear;
    map['refTypeInformation'] = _refTypeInformation;
    map['pwd'] = _pwd;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this._refUser = map['refUser'];
    this._refCompte = map['refCompte'];
    this._fName = map['fName'];
    this._lName = map['lName'];
    this._pic = map['pic'];
    this._email = map['email'];
    this._refWear = map['refWear'];
    this._refTypeInformation = map['refTypeInformation'];
    this._pwd = map['pwd'];
  }

  Future<int> saveUser(User user) async {
    var dbClient = await SqlHandler().db;
    var result = await dbClient.insert(tablename, user.toMap());

    return result;
  }

  Future<List> getAllUsers() async {
    var dbClient = await SqlHandler().db;
    var result = await dbClient.query(tablename, columns: [
      columnid,
      column_2,
      column_3,
      column_4,
      column_5,
      column_6,
      column_7,
      column_8,
      column_9,
    ]);

    return result.toList();
  }

  Future<User> getUser(String refUser) async {
    var dbClient = await SqlHandler().db;
    List<Map> result = await dbClient.query(tablename,
        columns: [
          columnid,
          column_2,
          column_3,
          column_4,
          column_5,
          column_6,
          column_7,
          column_8
        ],
        where: '$columnid = ?',
        whereArgs: [refUser]);
    if (result.length > 0) {
      return new User.fromMap(result.first);
    }
    return null;
  }

  Future<int> updateUser(User user) async {
    var dbClient = await SqlHandler().db;

    return await dbClient.update(tablename, user.toMap(),
        where: "$columnid = ?", whereArgs: [user.refUser]);
  }

  Future<int> deleteUSer(String refUser) async {
    var dbClient = await SqlHandler().db;
    return await dbClient
        .delete(tablename, where: "$columnid=?", whereArgs: [refUser]);
  }
}
