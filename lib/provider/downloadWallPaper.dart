
import 'package:flutter/widgets.dart';

import '../webService/downloadService.dart';

class DownloadWallPaper  with ChangeNotifier {
  DownloadService downloadService;

  DownloadWallPaper(this.downloadService);


  Future downloadWallpapers(String? originalUrl) async {
    await downloadService.downloadWallpapers(originalUrl!);
  }
}
