import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as p;
import 'package:sqflite/sqlite_api.dart';



class DBHelper{
  //to create a db
  static Future<Database> dataBase()async{
    final dbPath = await sql.getDatabasesPath(); // create a folder for db
    return sql.openDatabase(
      p.join(dbPath, 'places.db'),
      onCreate: (db, version){
        return db.execute('CREATE TABLE places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
      version: 1);
  }

  //to insert data
  static Future<void> insert(String table, Map<String, Object>data)async{
    final db = await DBHelper.dataBase();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace );  
  } 

  // to get data
  static Future<List<Map<String, dynamic>>> getData(String table)async{
    final db = await DBHelper.dataBase();
    return db.query(table);
  }
}