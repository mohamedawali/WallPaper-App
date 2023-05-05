import 'package:dio/dio.dart';

import '../constant/strings.dart';

class SearchService{
  Dio dio;
  SearchService(this.dio) {
    BaseOptions baseOptions = BaseOptions(baseUrl: url, headers: {
      "Authorization":
     authorization
    });
    dio = Dio(baseOptions);
  }

  Future<Map<String, dynamic>?> searchWallpapers(String text) async {

    Response? response;
    try{
     response = await dio.get("search",queryParameters: {"query":text});
return response.data;

    }on DioError catch(e){

      return  null;
    }

  }
}