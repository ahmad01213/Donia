import 'package:Donya/screens/Home.dart';
import 'package:Donya/widgets/Buttons.dart';
import 'package:Donya/widgets/SizedBoxWidget.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../helpers.dart';


class SuccessAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box(100),
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70), color: mainColor),
              child: Icon(Icons.check,color: Colors.white,size: 90,),
            ),
            Box(30),
            Texts(
              title: "شكرا لك",
              fSize: 30,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
            Box(30),
            Texts(
              title: "تم إرسال إعلانك للمراجعة",
              fSize: 20,
              weight: FontWeight.normal,
              color: Colors.grey,
            ),
            Box(30),
            Buttons(
              fSize: 16,
              title: "حسنا",
              horizontalMargin: 18,
              onPressed: (){
                replacePage(context, Home());
              },

              width: 300,

            )

          ],
        ),
      ),
    );
  }
}
