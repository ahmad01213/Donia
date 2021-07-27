import 'package:flutter/cupertino.dart';
import 'package:Donya/shared_data.dart';

import '../helpers.dart';

class hDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(horizontal: 0,vertical: 3),
    width: double.infinity,
    color: greyyColor,
  height: 0.4,
    );
  }
}
