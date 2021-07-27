import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers.dart';
class HelperFunctions {
  static HelperFunctions slt = HelperFunctions();
  notifyUser({context, message, color, bool isNeedPop = false}) {
    Flushbar(
      padding: EdgeInsets.all(30),
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: message,
      icon: Icon(
        Icons.circle,
        size: 28.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: color,
      animationDuration: Duration(milliseconds: 400),
      leftBarIndicatorColor: color,
    )..show(context).whenComplete(() {
        if (isNeedPop) pop(context);
      });
  }

 openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}

  // openGoogleMapLocation(lat,lng) async {
  //   String mapOptions = [
  //     'saddr=${locData.latitude},${locData.longitude}',
  //     'daddr=$lat,$lng',
  //     'dir_action=navigate'
  //   ].join('&');
  //
  //   final url = 'https://www.google.com/maps?$mapOptions';
  //   if (await canLaunch(url)) {
  //   await launch(url);
  //   } else {
  //   throw 'Could not launch $url';
  //   }
  // }

  showSheet(BuildContext context,child) {
    showModalBottomSheet(
      context: context,
      shape: cardRadiusTop(30),
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return child;
      },
    );
  }

  ShapeBorder cardRadiusTop(double radius) {
    return RoundedRectangleBorder(
      side: BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
    );
  }

  String formatDate(String date) {
    // final formatedDate =
    //     timeago.format(DateTime.parse(date), allowFromNow: true, locale: "ar");
    // return formatedDate;
    return date.split(" ")[0];
  }

