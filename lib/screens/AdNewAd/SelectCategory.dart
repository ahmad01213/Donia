import 'package:Donya/screens/AdNewAd/SelectSubCategory.dart';
import 'package:Donya/widgets/Boxh10.dart';
import 'package:Donya/widgets/Boxw10.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:Donya/widgets/btn_back.dart';
import 'package:Donya/widgets/divider.dart';
import 'package:flutter/material.dart';

import '../../helpers.dart';
import '../../shared_data.dart';
import '../SignInScreen.dart';
import '../addad.dart';
import '../categories.dart';
class Selectcategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    data=[];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: Texts(
          title: "اختر قسم للإعلان",
          fSize: 22,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: BtnBack(context),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [


          Container(
            height: 70,
            color: Colors.grey.withOpacity(0.1),
          ),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpOnD1rdyRWBzPkt-Zo53o6mzTVQbdO6IVYw&usqp=CAU',
              'عقارات',
              '234', onPressed: () {
            List subCategories = categoryList
                .where((category) => (category['parent'] == "عقارات"))
                .toList();
            pushPage(context, SelectSubCategory("عقارات", subCategories));
          }),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa65Rpw4liC9y1qMXsRhCgYdXHRZUy4l68eQ&usqp=CAU',
              'سيارات',
              '234', onPressed: () {
            List subCategories = categoryList
                .where((category) => (category['parent'] == "سيارات"))
                .toList();
            pushPage(context, SelectSubCategory("سيارات", subCategories));
          }),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIe4W2xf6XyZpVM8PECTzm71JU9XYsTYJzcQ&usqp=CAU',
              'وظائف',
              '234', onPressed: () {
            List subCategories = categoryList
                .where((category) => (category['parent'] == "وظائف"))
                .toList();
            pushPage(context, SelectSubCategory("وظائف", subCategories));
          }),
          // buildListItem(
          //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw88S8ettRHm4RqTLIA3CBXXkNvZMujj4mnA&usqp=CAU',
          //     'خدمات',
          //     '234', onPressed: () {
          //   List subCategories = categoryList
          //       .where((category) => (category['parent'] == "خدمات"))
          //       .toList();
          //   pushPage(context, Categories("خدمات", subCategories));
          // }),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtcEiHVAE1eoCDeW85Hvv5huIv6emwa6fK1w&usqp=CAU',
              'منوعات',
              '234', onPressed: () {
            List subCategories = categoryList
                .where((category) => (category['parent'] == "منوعات"))
                .toList();
            pushPage(context, SelectSubCategory("منوعات", subCategories));
          }),
        ],
      ),
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
                    image,
                    width: 35,
                    height: 35,
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
