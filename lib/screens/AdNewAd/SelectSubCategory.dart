import 'package:Donya/screens/addad.dart';
import 'package:flutter/material.dart';
import 'package:Donya/screens/ads_screen.dart';
import 'package:Donya/shared_data.dart';
import 'package:Donya/widgets/Boxh10.dart';
import 'package:Donya/widgets/Boxw10.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:Donya/widgets/btn_back.dart';
import 'package:Donya/widgets/divider.dart';

import '../../helpers.dart';
import '../categories.dart';


List<String> data = [];

class SelectSubCategory extends StatelessWidget {
 final String categoryName;
  List<dynamic> subcategories = [];
 SelectSubCategory(this.categoryName, this.subcategories);
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: Texts(
          title: categoryName,
          fSize: 22,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: BtnBack(context),

      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: subcategories.length+1,
          itemBuilder: (context,index){

        return index == 0?          Container(
          color: Colors.white,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "  ابحث في  "+categoryName,
                hintStyle: TextStyle(fontSize: 20, color: greyyColor)),
          ),
        ): buildListItem('', subcategories[index-1]['name'], '213',onPressed: (){
          data.add(subcategories[index-1]['name']);
          print(data);
          List options = optionList.where((o) =>o['parent']==categoryName ).toList();
          options.length==0?
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AddAd(),), (route) => route.isFirst)

              : pushPage(context, SelectSubCategory(subcategories[index-1]['name'], options));
        });
      }),
    );
  }


 buildListItem(image, title, count, {onPressed}) => InkWell(
   onTap: onPressed,
   child: Container(
     padding: EdgeInsets.symmetric(horizontal: 5),
     color: Colors.white,
     child: Column(
       children: [
         Boxh10(),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               children: [
                 Image.network(
                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY1m1ziO40-FYivwXlmaixwM_wzctrkFgpDQ&usqp=CAU',
                   width: 25,
                   height: 25,
                   fit: BoxFit.fill,
                 ),
                 Boxw10(),
                 Boxw10(),
                 Texts(
                   title: title,
                   fSize: 19,
                   weight: FontWeight.w100,
                   color: Colors.black,
                 ),
               ],
             ),
             Row(
               children: [
                 Texts(
                   title: count,
                   fSize: 14,
                   weight: FontWeight.w300,
                   color: greyyColor,
                 ),
                 Boxw10(),
                 Icon(
                   Icons.arrow_forward_ios_sharp,
                   size: 20,
                   color: mainColor,
                 )
               ],
             )
           ],
         ),
         Boxh10(),
         hDivider()
       ],
     ),
   ),
 );

}
