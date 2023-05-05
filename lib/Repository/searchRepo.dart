import '../models/randomResponse.dart';
import '../webService/searchService.dart';

class SearchRepo{
  SearchService searchService;

  SearchRepo(this.searchService);

  Future<List<Photos>?> searchWallpapers(String text) async {
    var response = await searchService.searchWallpapers(text);
    print('rr${response==null}');
    if(response!=null){
    return RandomResponse.fromJson(response!).photos;}
    else{
      return null;
    }
  }
}