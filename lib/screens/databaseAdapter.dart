import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DbAdapter{
  Future initDb() async{
    final dbpath = await getExternalStorageDirectory();
    final path = join(dbpath.path + "/DB","CAData.db");

    final exist = await databaseExists(path);

    if(exist){
      //database already exists
      //opendatabase
      print("Database alrady exist");
      print(path);
    }else{
      // db doesnot exist,create a new one
      print("Creating a copy from assets");

      try{
        await Directory(dirname(path)).create(recursive:true);
      }catch(_){}

      ByteData data = await rootBundle.load(join("assets","CAData.db"));
      List<int> bytes= data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      print("DB Copied");
    }
    await openDatabase(path);
  }
}