import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers.dart';
List<File> images = [];
class BundelImages extends StatefulWidget {
  @override
  _BundelImagesState createState() => _BundelImagesState();
}

class _BundelImagesState extends State<BundelImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (ctx, i) {
          return i == images.length
              ? InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    // where to position the child
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Stack(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: mainColor),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(
                children:[
                Container(
                  height: 140,
                  padding: const EdgeInsets.only(left: 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      images[i],
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          images.removeAt(i);
                        });
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white
                          ),
                          child: Icon(
                            Icons.close_outlined,

                            size: 25,
                          )),
                    ))
                ]
              );
        },
        itemCount: images.length + 1,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
  var _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    _image = File(pickedFile!.path);
    setState(() {
      images.add(_image);
    });
  }
}
