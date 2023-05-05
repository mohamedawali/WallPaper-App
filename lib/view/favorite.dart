import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_task/provider/favoriteProvider.dart';


class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((_) {
      Provider.of<FavoriteProvider>(context, listen: false).getFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Consumer<FavoriteProvider>(builder: (context, myData, child) {
          return GridView.builder(
              itemCount: myData.favoriteList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Card(

                  child: Stack(children: [
                    Image.network(
                      myData.favoriteList[index].imageUrl.toString(),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () async {
                            myData.deleteFavorite(
                                myData.favoriteList[index].photoId, index);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )),
                  ])));
        }));
  }
}
