import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_task/models/favoriteModel.dart';
import 'package:wallpaper_task/models/randomResponse.dart';
import 'package:wallpaper_task/provider/downloadWallPaper.dart';

import '../provider/favoriteProvider.dart';

class WallPaperDetails extends StatelessWidget {
  final Photos photosList;
final  int index;
  const WallPaperDetails(this.photosList, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    Size size = MediaQuery.of(context).size;
    DownloadWallPaper downloadWallPaper =
        Provider.of<DownloadWallPaper>(context);
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(onTap: ()async{
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
                          scaffoldKey.currentState!.showSnackBar(SnackBar(
                            content: Row(
                              children: const [
                                CircularProgressIndicator(),
                                Text('Downloaded Image!'),
                              ],
                            ),
                            duration: const Duration(seconds: 2),
                          ));
                        } else {
                     scaffoldKey.currentState!.showSnackBar(SnackBar(
                            content: Row(
                              children: const [Icon(Icons.error), Text('Wrong...!')],
                            ),
                            duration: const Duration(seconds: 2),
                          ));
                        }
            },
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('save'),
                Icon(
                  Icons.save_alt_outlined,
                  color: Colors.black,
                )
              ],
            )),
            PopupMenuItem(onTap: (){
              bool selected = favoriteProvider.isSelected(photosList.id);

                      if (!selected) {
                        favoriteProvider.addToFavorite(FavoriteModel(
                            photosList.id, photosList.src!.original.toString(), 1));
                      }
            },
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add to favorite'),
                Icon(
                  favoriteProvider.isSelected(photosList.id)
                            ?
                  Icons.favorite:Icons.favorite_border,
                  color: Colors.black,
                )
              ],
            ))
          ],
        )
      ]),
      body: Center(
        child: Hero(
          tag: 'image$index',
          child: Image.network(photosList.src!.original.toString(),
              fit: BoxFit.cover,
              height: size.width / 1.5,
              width: size.width / 1.5),
        ),
      ),
    );
  }
}
