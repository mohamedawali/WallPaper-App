import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'package:wallpaper_task/view/search.dart';

import '../provider/mainHome.dart';

import 'favorite.dart';
import 'home.dart';
class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
PageController pageController=PageController();
    return ChangeNotifierProvider(
      create: (context) => MainHomeProvider(),
      child: Consumer<MainHomeProvider>(
          builder: (context, prov, child) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.red,
                  unselectedItemColor: Colors.grey[300],
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
                    print('ccc${prov.currentScreen}');
                    pageController.animateToPage(prov.currentScreen, duration: const Duration(seconds: 1), curve: Curves.easeIn);
                    //pageController.jumpToPage(prov.currentScreen);

                  }),
              body: (SafeArea(child:
              PageView(controller: pageController,children: [const Home(),Search(),const Favorite()],onPageChanged: (currentIndex){ prov.changeScreen(currentIndex);},)
            //  bottomNavigator(prov.currentScreen)
              )))),
    );
  }

  bottomNavigator(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Home();

      case 1:
        return Search();

      case 2:
        return const Favorite();
    }
  }
}
