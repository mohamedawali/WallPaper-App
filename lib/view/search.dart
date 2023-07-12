import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_task/provider/searchProvider.dart';
import 'package:wallpaper_task/view/wallpaperDetails.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  var text = '';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Provider.of<SearchProvider>(context);
    return Container(
        color: Colors.black,
        child: Consumer<SearchProvider>(builder: (context, myData, child) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) => myData.searchWallpapers(text),
                decoration: const InputDecoration(
                  hintText: 'Where do you want ',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: myData.searchList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WallPaperDetails(
                                      myData.searchList[index], index)));
                        },
                        child: Card(
                            child:
                          Hero(tag: 'image$index',
                            child: Image.network(
                              myData.searchList[index].src!.original.toString(),
                              fit: BoxFit.cover,
                              width: screenSize.width,
                              height: screenSize.height,
                            ),
                          ),
                        )
                        //),
                        )))
          ]);
        }));
  }
}
