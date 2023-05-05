import 'dart:async';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:wallpaper_task/constant/db.dart';

class DbHelper {
  DbHelper._instance();
  factory DbHelper(){
    return  DbHelper._instance();
  }
  Future<String> getMyDataBasePath() async {
    String path = await getDatabasesPath();
    return join(path, dbName);
  }

  Future<Database>getMyDataBaseInstance() async {
    String filePath = await getMyDataBasePath();
    return openDatabase(filePath,
        version: dbVersion,
        onCreate: (db, dbVersion) => onCreateDb(db),
        onUpgrade: (db, oldVersion, newVersion) => onUpgradeDb(db));
  }

  onCreateDb(Database db) {
    String table =
        'create table $tableName ( $columnId integer primary key autoincrement ,  $columnPhotoId integer ,$columnUrlImage text ,$columnIsFavorite integer )';
    print('tabv$table');
    db.execute(table);
  }

  onUpgradeDb(Database db) {
    var upgrade = 'drop table IF EXISTS $tableName';
    db.execute(upgrade);

    onCreateDb(db);
  }

}
