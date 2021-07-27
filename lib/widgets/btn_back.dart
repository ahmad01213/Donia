import 'package:Donya/screens/AdNewAd/SelectSubCategory.dart';
import 'package:flutter/material.dart';
import 'package:Donya/shared_data.dart';

import '../helpers.dart';

class BtnBack extends StatelessWidget {
  final context;
  Color color;
  BtnBack(this.context, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return IconButton(

      onPressed: () {
        data = [];
        pop(context);
      },
      icon: Icon(Icons.arrow_back,size: 25,color: color,),

    );
  }
}
