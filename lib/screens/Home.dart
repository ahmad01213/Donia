import 'package:Donya/Providers/AdsProvider.dart';
import 'package:Donya/screens/MyAds.dart';
import 'package:Donya/screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:Donya/screens/SignInScreen.dart';
import 'package:Donya/screens/addad.dart';
import 'package:Donya/screens/categories.dart';
import 'package:Donya/shared_data.dart';
import 'package:Donya/widgets/Boxh10.dart';
import 'package:Donya/widgets/Boxw10.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:Donya/widgets/divider.dart';
import 'package:provider/provider.dart';

import '../helpers.dart';
class Home extends StatelessWidget {
 late AdsProvider _adsProvider;
 bool start = true;
 initData() async {
  await readToken();

   _adsProvider.getUserAds();
 }
  @override
  Widget build(BuildContext context) {
    if(start){
      _adsProvider = Provider.of<AdsProvider>(context);
      initData();
      start=false;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Texts(
              title: "دنيا ـ  مصر",
              fSize: 22,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
            IconButton(
              onPressed: (){
                pushPage(context, SignInScreen());
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 40,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          TextFormField(
            onTap: (){
              pushPage(context, SearchScreen());
            },
            decoration: InputDecoration(
                hintText: "  ما الذي تبحث عنه ؟  ",
                hintStyle: TextStyle(fontSize: 20, color: greyyColor)),
          ),
          buildListItem(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROiT9UzUtnKUmODnr5mQiDQvmUDIGs7ZUtsQ&usqp=CAU',
            'نشر إعلان',
            '',
            onPressed: () =>pushPage(context, isRegistered()? AddAd():SignInScreen()),
          ),
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
            pushPage(context, Categories("عقارات", subCategories));
          }),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa65Rpw4liC9y1qMXsRhCgYdXHRZUy4l68eQ&usqp=CAU',
              'سيارات',
              '234', onPressed: () {
            List subCategories = categoryList
                .where((category) => (category['parent'] == "سيارات"))
                .toList();
            pushPage(context, Categories("سيارات", subCategories));
          }),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIe4W2xf6XyZpVM8PECTzm71JU9XYsTYJzcQ&usqp=CAU',
              'وظائف',
              '234', onPressed: () {
            List subCategories = categoryList
                .where((category) => (category['parent'] == "وظائف"))
                .toList();
            pushPage(context, Categories("وظائف", subCategories));
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
            pushPage(context, Categories("منوعات", subCategories));
          }),
          Container(
            height: 70,
            color: Colors.grey.withOpacity(0.1),
          ),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtlv5MBusnTkk4vdPyROxnU7j06DwK2V9dGQ&usqp=CAU',
              'الإعلانات المرفوضة',
              '234',
              onPressed: (){
                pushPage(context, MyAds(2, "الإعلانات المرفوضة"));
              }
          ),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQgiZH5IBvQwwtiN6ubXbqn3YDom-j_FWOVw&usqp=CAU',
              'الإعلانات الفعالة',
              '234',
              onPressed: (){
                pushPage(context, MyAds(0, "الإعلانات الفعالة"));
              }
          ),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFMbNVzFSSAvPOoRYjQUaRj7IfmV2bLtWwbg&usqp=CAU',
              'الإعلانات المعلقة',
              '234',
            onPressed: (){
                pushPage(context, MyAds(1, "الإعلانات المعلقة"));
            }
          ),
          Container(
            height: 70,
            color: Colors.grey.withOpacity(0.1),
          ),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2QzXOURtFEuQDV8WepJ1LzplEEoqvAz081aQKvezRe-JwO5dTP2BD6z2OyqJvrq3_Lps&usqp=CAU',
              'مصر',
              ''),
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
