import 'package:flutter/material.dart';
import 'package:rafeeg/widgets/Boxh10.dart';
import 'package:rafeeg/widgets/ImageGallary.dart';
import 'package:rafeeg/widgets/Texts.dart';
import 'package:rafeeg/widgets/btn_back.dart';
import 'package:rafeeg/widgets/home_slider.dart';

import '../shared_data.dart';

class AddDetailPage extends StatelessWidget {
  final images = [
    'https://cdn.pixabay.com/photo/2016/12/03/18/57/car-1880381__480.jpg',
    'https://cdn.pixabay.com/photo/2015/09/02/12/25/bmw-918407__480.jpg',
        "https://c6.mourjan.com/repos/d/p152/1523911/6062a5511b086.webp",
    "https://c6.mourjan.com/repos/d/p152/1523911/6062a55117bb5.webp"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: Texts(
          title: "تفاصيل الإعلان",
          fSize: 22,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: BtnBack(context),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          MaterialButton(
            padding: EdgeInsets.only(bottom: 20),
            onPressed: (){
              pushPage(context, ImageGallary(images));
            },
            child: Container(
                height: 200,
                child: HomeSlider(
                  imagesUrlList: images,
                  width: MediaQuery.of(context).size.width,
                  height:
                  MediaQuery.of(context).size.height * 0.45,
                  autoPlay: false,
                )),
          ),
          Boxh10(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Texts(
              lines: 20,
              fSize: 22,
              weight: FontWeight.normal,
              title:
              "  من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل  من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل  من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل",

            ),
          ),
          Boxh10(),
          Boxh10(),
          buildButton("محمد رحمان الخولي", Icons.account_circle, mainColor, (){}),
          buildButton("الموقع علي الخريطة", Icons.location_on, Colors.blue, (){}),
          buildButton("503841961", Icons.call, Colors.green, (){}),
        ],
      ),
    );
  }

  buildButton(title,icon,color,onPress){
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,

        ),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Boxh10(),
              Center(
                child: Texts(
                  title: title,
                  color: Colors.white,
                  weight: FontWeight.bold,
                  fSize: 18,
                ),
              )
              ,
              Icon(icon,size: 30,color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
