import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_task/provider/HomeProvider.dart';
import 'package:wallpaper_task/view/wallpaperDetails.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((_) {
      Provider.of<HomeProvider>(context, listen: false).randomWallpapers();
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Container(
            color: Colors.black,
            child: Consumer<HomeProvider>(builder: (context, myData, child) {
              return GridView.builder(
                  itemCount: myData.photosList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                     ),
                  itemBuilder: (context, index) => InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        WallPaperDetails( myData.photosList[index],index)));},
                    child: Card(

                              child:
                              Hero(tag: "image$index",
                                child: Image.network(
                                  myData.photosList[index].src!.original.toString(),
                                  fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height ,

                                ),
                              )

                        ),
                  ));
            }));
  }
}
