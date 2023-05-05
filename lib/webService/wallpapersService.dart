import 'package:dio/dio.dart';


import '../constant/strings.dart';

class WallpapersService {
  Dio dio;
  WallpapersService(this.dio) {
    BaseOptions baseOptions = BaseOptions(baseUrl: url, headers: {
      "Authorization":
         authorization
    });
    dio = Dio(baseOptions);
  }

  Future<Map<String, dynamic>> randomWallpapers() async {
    Response response = await dio.get("curated");

    return response.data;
  }

  Future uploadImage(FormData formData) async {
    await dio.post("upload", data: formData);
  }
}
