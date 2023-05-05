
import 'package:flutter/widgets.dart';
import 'package:wallpaper_task/Repository/searchRepo.dart';

import '../Repository/randomRepo.dart';
import '../models/randomResponse.dart';

class SearchProvider  with ChangeNotifier{
  SearchRepo searchRepo;
  SearchProvider(this.searchRepo);

  List<Photos> _searchList=[];
  List<Photos> get searchList =>_searchList;
  Future searchWallpapers(String text) async {

    await searchRepo.searchWallpapers(text).then((value) {
      value==null?_searchList.clear():
        _searchList = value;
        notifyListeners();


      });

}

}