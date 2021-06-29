import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:rafeeg/shared_data.dart';
import 'package:rafeeg/widgets/Boxh10.dart';
import 'package:rafeeg/widgets/Buttons.dart';
import 'package:rafeeg/widgets/Texts.dart';
import 'package:rafeeg/widgets/btn_back.dart';

class AddAd extends StatefulWidget {
  @override
  _AddAdState createState() => _AddAdState();
}

class _AddAdState extends State<AddAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BtnBack(context),
        centerTitle: false,
        title: Texts(
          title: "نشر إعلان",
          fSize: 18,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.orange.withOpacity(0.05),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texts(
                title: " أضف صورا للإعلان",
                color: Colors.green,
                weight: FontWeight.w300,
                fSize: 18,
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                margin: EdgeInsets.all(0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV2W5ZjXkiyzpFnENnohxqIShsi-IV12HQBw&usqp=CAU',
                        width: 50,
                        height: 50,
                      ))),
                ),
              ),
            ),
            buildPageItem("اختار القسم", "اختر غاية الإعلان ؟", () {}),
            buildPageItem("اتصل بنا", "أضف رقم هاتف", () {}),
            buildPageItem("راسلني", "أضف بريدك الإلكتروني", () {}),
            buildPageItem("نص الإعلان", "اكتب تفاصيل إعلانك", () {}),
            buildPageItem(
                "مكان الإعلان", "حدد موقع الإعلان علي الخريطة", () {
              showLocationPicker(
                  context,
                  Platform.isAndroid
                      ? "AIzaSyDFZhFfswZpcjeUDYm6C7H46JLdSonK0f4"
                      : "AIzaSyDJ6UDHt4avEm0mjMYTBD5SHdHkd4Odau4",
                  // initialCenter: LatLng(31.1975844, 29.9598339),
                  myLocationButtonEnabled: true,
                  layersButtonEnabled: false,
                  language: 'ar',
                  appBarColor: Colors.white, onConfirm: (LocationResult loc) {

                // // print("ssss " + loc.address);
                // SchedulerBinding.instance.addPostFrameCallback((_) {
                //   replacePage(
                //       context: context,
                //       page: AddNewService(
                //         locationResult: loc,
                //       ));
                // });
              },
                  searchBarBoxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  )
                // countries: ['AE', 'NG'],
              );
            }),
            Boxh10(),
            Buttons(
              title: "نشر الإعلان",
              onPressed: () {},
              width: 500,
              horizontalMargin: 10,
              radius: 7,
              bgColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }

  buildPageItem(title, desc, onPress) => MaterialButton(
    onPressed: onPress,
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Texts(
                title: title,
                color: Colors.green,
                weight: FontWeight.w300,
                fSize: 18,
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                margin: EdgeInsets.all(0),
                elevation: 1,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Texts(
                          title: desc,
                          align: TextAlign.start,
                          color: Colors.grey,
                          weight: FontWeight.w300,
                          fSize: 18,
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Boxh10()
          ],
        ),
  );
}
