import 'package:flutter/material.dart';
import 'package:rafeeg/shared_data.dart';

class BtnBack extends StatelessWidget {
  final context;
  Color color;
  BtnBack(this.context, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return IconButton(

      onPressed: () {
        pop(context);
      },
      icon: Icon(Icons.arrow_back,size: 25,color: color,),

    );
  }
}
