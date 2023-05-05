import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:wallpaper_task/dependanceInjection.dart';
import 'package:wallpaper_task/provider/HomeProvider.dart';

import 'package:wallpaper_task/view/search.dart';

import '../provider/mainHome.dart';
import '../provider/searchProvider.dart';
import 'favorite.dart';
import 'home.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
 int _currentIndex = 0;
  // CitiesResponseModel? citiesList;
  // ProfileResponseModel? profileResponseModel;
  // List<RandomIMageResponseModel>? randomImageList;
  // List<RecommendRecentViewModel>? recommendImageList;
  // List<RecommendRecentViewModel>? recentImageList;
  // List<PackagesResponseModel>? packagemageList;
  // List<FavoriteModel>? listFavorite;

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context)=>MainHomeProvider(),
      child: Consumer<MainHomeProvider>(builder: (context,prov,child)=>Scaffold(

       
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,selectedItemColor: Colors.red,unselectedItemColor:Colors.grey[300] ,
         // unselectedIconTheme: IconThemeData(color: Colors.grey[300]),
         //      selectedIconTheme: const IconThemeData(color: Colors.red),
          //   fixedColor: Colors.grey[100],
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
            
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: prov.currentScreen,
              onTap: (index) {
prov.changeScreen(index);
              }


          ),
          body: (SafeArea(child: bottomNavigator(prov.currentScreen))))),
    );
  }

  bottomNavigator(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return   const Home();

      case 1:
        return Search();

      case 2:
        return const Favorite();

     
    }
  }
}
