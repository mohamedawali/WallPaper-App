import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:wallpaper_task/Repository/favoriteRepo.dart';
import 'package:wallpaper_task/Repository/randomRepo.dart';
import 'package:wallpaper_task/provider/HomeProvider.dart';
import 'package:wallpaper_task/provider/downloadWallPaper.dart';
import 'package:wallpaper_task/provider/favoriteProvider.dart';
import 'package:wallpaper_task/provider/searchProvider.dart';
import 'package:wallpaper_task/webService/favoriteService.dart';
import 'package:wallpaper_task/webService/downloadService.dart';
import 'package:wallpaper_task/webService/searchService.dart';
import 'package:wallpaper_task/webService/wallpapersService.dart';

import 'Repository/searchRepo.dart';
import 'localDatabase.dart';

final getIt = GetIt.I;
void initGetIt() {
  getIt.registerLazySingleton<HomeProvider>(() => HomeProvider(getIt()));
  getIt.registerLazySingleton<RandomRepo>(() => RandomRepo(getIt()));
  getIt
      .registerLazySingleton<WallpapersService>(() => WallpapersService(Dio()));

  getIt.registerLazySingleton<SearchProvider>(() => SearchProvider(getIt()));
  getIt.registerLazySingleton<SearchRepo>(() => SearchRepo(getIt()));
  getIt.registerLazySingleton<SearchService>(() => SearchService(Dio()));

  getIt.registerLazySingleton<DownloadWallPaper>(
      () => DownloadWallPaper(getIt()));
  getIt.registerLazySingleton<DownloadService>(() => DownloadService(Dio()));
  getIt
      .registerLazySingleton<FavoriteProvider>(() => FavoriteProvider(getIt()));
  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt()));
  getIt.registerLazySingleton<FavoriteService>(
      () => FavoriteService(DbHelper()));
}
