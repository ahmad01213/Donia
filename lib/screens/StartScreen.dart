import 'package:flutter/material.dart';
import 'package:Donya/screens/Home.dart';
import 'package:Donya/screens/SignInScreen.dart';
import 'package:Donya/screens/categories.dart';
import 'package:Donya/widgets/Texts.dart';

import '../helpers.dart';
import '../shared_data.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // signOut();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
                List subCategories = categoryList
                    .where((category) => (category['parent'] == "خدمات"))
                    .toList();
                pushPage(context, Categories("خدمات", subCategories));
              },

              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.business_center_sharp,size: 70,color: Colors.white,),
              ),
            ),
            SizedBox(height: 10,),

            Texts(title: "خدمات الصيانة",fSize: 22,color: Colors.black,),
            Divider(),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: (){
                pushPage(context, Home());
              },
                         child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.business,size: 70,color: Colors.white,),
              ),
            ),
            SizedBox(height: 10,),

            Texts(title: "الإعلانات المبوبة",fSize: 22,color: Colors.black,),

          ],),
      ),
    );
  }
}
