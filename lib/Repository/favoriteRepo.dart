import 'package:wallpaper_task/models/favoriteModel.dart';
import 'package:wallpaper_task/webService/favoriteService.dart';

class FavoriteRepo{
FavoriteService favoriteService;

FavoriteRepo(this.favoriteService);

Future addToFavorite(String originalUrl, int? id, int favorite) async {
  var favorites = FavoriteModel(id,originalUrl,favorite).addFavorite();

 await favoriteService.addToFavorite(favorites);


}
Future<List<FavoriteModel>> getFavorite() async {


 var favoriteList = await favoriteService.getFavorite();
return favoriteList.map((e) =>  FavoriteModel.getFavorite(e)).toList();


}

  deleteFavorite(int? photoId) async{
    await favoriteService.deleteFavorite(photoId);
  }
}