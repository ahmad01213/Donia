import 'package:flutter/material.dart';
import 'package:rafeeg/screens/SignInScreen.dart';
import 'package:rafeeg/screens/addad.dart';
import 'package:rafeeg/screens/categories.dart';
import 'package:rafeeg/shared_data.dart';
import 'package:rafeeg/widgets/Boxh10.dart';
import 'package:rafeeg/widgets/Boxw10.dart';
import 'package:rafeeg/widgets/Texts.dart';
import 'package:rafeeg/widgets/divider.dart';
import 'package:rafeeg/widgets/textfields.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Texts(
              title: "دنيا السعودية",
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
            decoration: InputDecoration(
                hintText: "  ما الذي تبحث عنه ؟  ",
                hintStyle: TextStyle(fontSize: 20, color: greyyColor)),
          ),
          buildListItem(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROiT9UzUtnKUmODnr5mQiDQvmUDIGs7ZUtsQ&usqp=CAU',
            'نشر إعلان',
            '',
            onPressed: () => pushPage(context, AddAd()),
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
              '234'),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQgiZH5IBvQwwtiN6ubXbqn3YDom-j_FWOVw&usqp=CAU',
              'الإعلانات الفعالة',
              '234'),
          buildListItem(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFMbNVzFSSAvPOoRYjQUaRj7IfmV2bLtWwbg&usqp=CAU',
              'الإعلانات المعلقة',
              '234'),
          Container(
            height: 70,
            color: Colors.grey.withOpacity(0.1),
          ),
          buildListItem(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Flag_of_Saudi_Arabia.svg/800px-Flag_of_Saudi_Arabia.svg.png',
              'السعودية',
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
