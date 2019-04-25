
import 'package:sqflite/sqflite.dart';

void populateDb(Database database,int version) async{
  String sqlString= 'CREATE TABLE CUSTOMER ( "id INTEGER PRIMARY KEY," "first_name TEXT," "last_name TEXT," email TEXT"")" ';
  
  
    await database.execute(sqlString);
    

}