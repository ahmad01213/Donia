import 'package:flutter/material.dart';
import 'package:Donya/widgets/btn_back.dart';
import 'package:Donya/widgets/slider.dart';


class ImageGallary extends StatelessWidget {
  final images;
  final int initIndex ;
  ImageGallary(this.images, {this.initIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.infinity,
        width: double.infinity,
        color:Colors.black,

        child: Stack(
          children: [
            ImageSlider(
                images: images,
                initialIndex: initIndex,
                auto:false
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: BtnBack(context,),
            )
          ],
        ),
      ),
    );
  }
}
