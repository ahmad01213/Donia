import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
// import 'CircularProgress.dart';
class CarouselSliderWidget extends StatelessWidget {
   CarouselSliderWidget({
    required this.imagesUrlList,
    required this.width,
    required this.height,
    required this.onImageChange,
    this.initIndex = 0,
    this.autoPlay = true,
  }) ;

  final List imagesUrlList;
  final double height;
  final double width;
  final int initIndex ;
  final bool autoPlay;
  final  Function(int,int) onImageChange;
  bool start = true;
  @override
  Widget build(BuildContext context) {
    if(start){
      start = false;
      print(initIndex);
    }
    return Carousel(
      boxFit: BoxFit.cover,
      initialIndex: initIndex,
      autoplay: autoPlay,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 500),
      dotSize: 0.0,
      dotIncreasedColor: Colors.transparent,
      dotBgColor: Colors.transparent,
      dotPosition: DotPosition.bottomCenter,
      dotVerticalPadding: 10.0,
      onImageChange: onImageChange,
      showIndicator: true,
      indicatorBgPadding: 7.0,
      images: imagesUrlList.map((image) {
        return Builder(builder: (BuildContext context) {
          return Container(
            child:   PhotoView(

              imageProvider: CachedNetworkImageProvider(
                 image,

              ),
            ),
          );
        });
      }).toList(),
    );
  }
}
