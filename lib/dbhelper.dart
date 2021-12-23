import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class DataBaseHelper{
 static final _databasename = "persons.db"; 
 static final _databaseversion = 1;

 static final table = "my_table";
 static final columnID = 'id';
 static final columnName = 'name';
 static final columnage = 'age';
 static Database _database;

 DataBaseHelper._privateConstructor();
 static final DataBaseHelper instance = DataBaseHelper._privateConstructor();
   
Future<Database> get databse async{
  if(_database !=null){
    return _database;
  }
  else{ 
     _database = await _initDatabase();
    return _database;
  }
}

_initDatabase() async{
  Directory documentdirectory = await getApplicationDocumentsDirectory();
  String path = join(documentdirectory.path,_databasename);
  return await openDatabase(path,version: _databaseversion,onCreate: _onCreate);
}

Future _onCreate(Database db, int version) async{
  await db.execute(
  '''
  CREATE TABLE $table (
    $columnID INTEGER PRIMARY KEY,
    $columnName  TEXT NOT NULL,
    $columnage INTEGER NOT NULL
  )
  ''');
}


// Functions to insert ,query, update and delete
Future<int>insert(Map<String,dynamic>row) async{
  Database db = await instance.databse;
  return await db.insert(table, row);
}

// Query all rows
Future<List<Map<String,dynamic>>> queryallrow() async{
  Database db = await instance.databse;
  return await db.query(table);
}
}