import 'package:flutter/material.dart';

import 'CarouselSlider.dart';

class ImageSlider extends StatefulWidget {
   final List images;
  final bool auto;
  final int initialIndex;
  ImageSlider({this.images=const [],this.auto = true,this.initialIndex=1});
  @override
  _ImageSliderState createState() => _ImageSliderState();
}
class _ImageSliderState extends State<ImageSlider> {
  int currentSlideIndex=1;
  @override
  void initState() {
    print(widget.initialIndex);
    super.initState();
    currentSlideIndex = widget.initialIndex+1;
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          CarouselSliderWidget(
            imagesUrlList: widget.images,
            width: MediaQuery.of(context).size.width,
           initIndex: widget.initialIndex,

            height: MediaQuery.of(context).size.height * 0.35,
            autoPlay: widget.auto,
            onImageChange:onImageChange,

          ),
          Positioned(
            child: Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54.withOpacity(0.5)),
              child: Center(
                  child: Text(
                    '$currentSlideIndex  /  ${widget.images.length ?? 0}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
            ),
            left: 20,
            top: 70,
          )
        ],
      ),
    );
  }



  onImageChange(prevIndex, currentIndex) {
    setState(() {
      currentSlideIndex = currentIndex + 1;
    });
  }
}
