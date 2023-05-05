
import '../models/randomResponse.dart';
import '../webService/wallpapersService.dart';

class RandomRepo {
  WallpapersService wallpapersService;

  RandomRepo(this.wallpapersService);

  Future<List<Photos>?> randomWallpapers() async {
    var response = await wallpapersService.randomWallpapers();
  return RandomResponse.fromJson(response).photos;
  }


}
