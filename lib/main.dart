import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_task/dependanceInjection.dart';
import 'package:wallpaper_task/provider/HomeProvider.dart';
import 'package:wallpaper_task/provider/downloadWallPaper.dart';
import 'package:wallpaper_task/provider/favoriteProvider.dart';
import 'package:wallpaper_task/provider/searchProvider.dart';
import 'package:wallpaper_task/view/mainHome.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>getIt<HomeProvider>()),

     ChangeNotifierProvider(create: (context)=>getIt<SearchProvider>()),
      ChangeNotifierProvider(create: (context)=>getIt<DownloadWallPaper>()),
      ChangeNotifierProvider(create: (context)=>getIt<FavoriteProvider>())


    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          appBarTheme: AppBarTheme(backgroundColor: Colors.black)
        ),
        home: const MainHome(),
      ),
    );
  }
}

