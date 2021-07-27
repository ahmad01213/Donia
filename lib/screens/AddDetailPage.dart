import 'package:Donya/Helpers/Functions.dart';
import 'package:Donya/Models/Ad.dart';
import 'package:flutter/material.dart';
import 'package:Donya/widgets/Boxh10.dart';
import 'package:Donya/widgets/ImageGallary.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:Donya/widgets/btn_back.dart';
import 'package:Donya/widgets/home_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers.dart';
import '../helpers.dart';

class AddDetailPage extends StatelessWidget {
  Ad ad;

  AddDetailPage(this.ad);


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
              pushPage(context, ImageGallary(ad.photos.map((e) => e.url).toList()));
            },
            child: Container(
                height: 200,
                child: HomeSlider(
                  imagesUrlList: ad.photos.map((e) => e.url).toList(),
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
              title:ad.title

            ),
          ),
          Boxh10(),
          Boxh10(),
          // buildButton(ad, Icons.account_circle, mainColor, (){}),
          buildButton("الموقع علي الخريطة", Icons.location_on, Colors.blue, (){
            HelperFunctions.slt.openMap(ad.lat, ad.lng);
          }),
          buildButton(ad.phone, Icons.call, Colors.green, (){
            _makePhoneCall('tel:${ad.phone}');
          }),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
