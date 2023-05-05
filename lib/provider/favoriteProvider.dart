import 'package:flutter/foundation.dart';

import '../Repository/favoriteRepo.dart';
import '../models/favoriteModel.dart';

class FavoriteProvider with ChangeNotifier {
  FavoriteRepo favoriteRepo;
  FavoriteProvider(this.favoriteRepo);
  List<FavoriteModel> _favoriteList = [];
  bool isFavorite = false;
  List<FavoriteModel> get favoriteList=>_favoriteList;

  Future getFavorite() async {
    await favoriteRepo.getFavorite().then((value) {
      _favoriteList = value;
      notifyListeners();
    });
  }

  deleteFavorite(int? photoIds,int? index) async {

   _favoriteList.removeAt(index!);
    await favoriteRepo.deleteFavorite(photoIds);

    notifyListeners();
  }



  isSelected(int? id) {
    return _favoriteList.any((element) => element.photoId==id);
  }

  Future addToFavorite(FavoriteModel favoriteModel) async{
   
    await favoriteRepo.addToFavorite(favoriteModel.imageUrl!,favoriteModel.photoId ,favoriteModel.isFavorite! );
    _favoriteList.add(favoriteModel);
    notifyListeners();
  }



}
