
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_task/provider/searchProvider.dart';
import 'package:wallpaper_task/view/wallpaperDetails.dart';


// class Search extends StatefulWidget {
//
//   const Search( {Key? key}) : super(key: key);
//
//   @override
//   State<Search> createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   Color color = const Color(0xFFBDBDBD);
//   TextEditingController searchController = TextEditingController();
//   List<Items>? items;
//   List<Items>? searchList;
//
class Search extends StatelessWidget {
   Search({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
var text='';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
Provider.of<SearchProvider>(context);
    return Container(color: Colors.black,
        child: Consumer<SearchProvider>(builder: (context, myData, child){
         return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(

                    onChanged: (text) => myData.searchWallpapers(text),
                    decoration:  InputDecoration(
                      hintText: 'Where do you want ',fillColor: Colors.white,filled: true,
                      prefixIcon: Icon(Icons.search,),border: InputBorder.none,
                    ),
                  ),
                ),Expanded(child:
                GridView.builder(
                    itemCount: myData.searchList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
          WallPaperDetails( myData.searchList[index])));},child:Card(

                        child:
                        Stack(
                          children:[ Image.network(
                            myData.searchList[index].src!.original.toString(),
          fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height ,

          ),

          ])
                        )
                      //),
                    )))






              ]);
        }

    ))
    ;
  }

}
