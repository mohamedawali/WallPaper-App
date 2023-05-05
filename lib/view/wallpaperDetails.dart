import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_task/models/favoriteModel.dart';
import 'package:wallpaper_task/models/randomResponse.dart';
import 'package:wallpaper_task/provider/downloadWallPaper.dart';

import '../provider/favoriteProvider.dart';

class WallPaperDetails extends StatelessWidget {
  final Photos photosList;
  const WallPaperDetails(this.photosList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DownloadWallPaper downloadWallPaper =
        Provider.of<DownloadWallPaper>(context);
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(photosList.src!.original.toString()),
                fit: BoxFit.fill)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final status = await Permission.storage.request();

                  if (status.isGranted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Downloading WallPaper...')
                      ],
                    )));

                    await downloadWallPaper.downloadWallpapers(
                        photosList.src!.original.toString());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Downloaded Image!'),
                        ],
                      ),
                      duration: const Duration(seconds: 2),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                        children: const [Icon(Icons.error), Text('Wrong...!')],
                      ),
                      duration: const Duration(seconds: 2),
                    ));
                  }
                },
                child: const Icon(Icons.download_outlined)),
            const Spacer(),
            IconButton(
              onPressed: () async {
                bool selected = favoriteProvider.isSelected(photosList.id);

                if (!selected) {
                  favoriteProvider.addToFavorite(FavoriteModel(
                      photosList.id, photosList.src!.original.toString(), 1));
                }
              },
              icon: favoriteProvider.isSelected(photosList.id)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
