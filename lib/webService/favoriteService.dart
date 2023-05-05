import 'package:sqflite/sqflite.dart';
import 'package:wallpaper_task/constant/db.dart';
import 'package:wallpaper_task/localDatabase.dart';

class FavoriteService{


  DbHelper dbHelper;
  FavoriteService(this.dbHelper);

  addToFavorite(Map<String, dynamic> favorite) async {
  Database database = await dbHelper.getMyDataBaseInstance();
  await database.insert(tableName, favorite).then((value) => print('val$value'));

  }
Future<List<Map<String,dynamic>>>getFavorite()async{
  Database database = await dbHelper.getMyDataBaseInstance();
 return await database.query(tableName,orderBy: columnPhotoId);
}

  deleteFavorite(int? photoId)async {
    Database database = await dbHelper.getMyDataBaseInstance();
    return await database.delete(tableName,where:'$columnPhotoId =?',whereArgs: [photoId] );
  }

}