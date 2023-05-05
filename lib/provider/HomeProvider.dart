
import 'package:flutter/widgets.dart';

import '../Repository/randomRepo.dart';
import '../models/randomResponse.dart';

class HomeProvider  with ChangeNotifier{
  RandomRepo randomRepo;
  HomeProvider(this.randomRepo);

   List<Photos> _photosList=[];
  List<Photos> get photosList =>_photosList;
  Future randomWallpapers() async {
   await randomRepo.randomWallpapers().then((value) {_photosList=value!;
   notifyListeners();});

  }
}