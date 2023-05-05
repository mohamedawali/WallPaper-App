
import 'dart:typed_data';


import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class DownloadService {
  Dio dio;
  DownloadService(this.dio) ;


  downloadWallpapers(String text) async {
    Response response = await dio.get(
text,
        options: Options(responseType: ResponseType.bytes));
 await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "recent");

  }
}
