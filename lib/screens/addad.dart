import 'dart:io';

import 'package:Donya/Helpers/Functions.dart';
import 'package:Donya/Providers/AdsProvider.dart';
import 'package:Donya/helpers.dart';
import 'package:Donya/screens/AdNewAd/BundelImages.dart';
import 'package:Donya/screens/AdNewAd/SelectCategory.dart';
import 'package:Donya/screens/AdNewAd/SelectSubCategory.dart';
import 'package:Donya/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:Donya/widgets/Boxh10.dart';
import 'package:Donya/widgets/Buttons.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:Donya/widgets/btn_back.dart';
import 'package:provider/provider.dart';

class AddAd extends StatefulWidget {
  @override
  _AddAdState createState() => _AddAdState();
}

class _AddAdState extends State<AddAd> {
  final Map<String, String> formData = {};
  final formKey = GlobalKey<FormState>();
  late var _adsProvider;
  @override
  void initState() {
    images=[];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _adsProvider = Provider.of<AdsProvider>(context);
    print('hey');
    return Stack(
      children: [
        Scaffold(
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
            child: Form(
              key: formKey,
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
                  BundelImages(),
                  buildFormItem(
                      "اختار القسم",
                      data.length != 2
                          ? "اختر غاية الإعلان ؟"
                          : data[0] + "  ->  " + data[1], () async {
                    var res = await pushPage(context, Selectcategory());

                    setState(() {});
                  }),
                  buildPageItem("اتصل بنا", "أضف رقم هاتف", "phone"),
                  buildPageItem("راسلني", "أضف بريدك الإلكتروني", "email"),
                  buildPageItem("", "عنوان الإعلان", "title"),
                  buildPageItem(
                      "نص الإعلان", "اكتب تفاصيل إعلانك", "description",
                      lines: 7, height: 180),
                  buildFormItem("مكان الإعلان", "حدد موقع الإعلان علي الخريطة",
                      () {
                    showLocationPicker(
                        context,
                        Platform.isAndroid
                            ? "AIzaSyDFZhFfswZpcjeUDYm6C7H46JLdSonK0f4"
                            : "AIzaSyDJ6UDHt4avEm0mjMYTBD5SHdHkd4Odau4",
                        // initialCenter: LatLng(31.1975844, 29.9598339),
                        myLocationButtonEnabled: true,
                        layersButtonEnabled: false,
                        language: 'ar',
                        appBarColor: Colors.white,
                        onConfirm: (LocationResult loc) {
                      // // print("ssss " + loc.address);
                      // SchedulerBinding.instance.addPostFrameCallback((_) {
                      //   replacePage(
                      //       context: context,
                      //       page: AddNewService(
                      //         locationResult: loc,
                      //       ));
                      // });
                      formData['lat'] = loc.latLng.latitude.toString();
                      formData['lng'] = loc.latLng.longitude.toString();
                      pop(context);
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
                    onPressed: () {
                      formData['category'] = data[0];
                      formData['country'] = 'eg';
                      formData['subcategory'] = data[1];
                      if (formKey.currentState!.validate()) {
                        if (images.isEmpty) {
                          HelperFunctions.slt.notifyUser(
                              context: context,
                              message: "اختر صور للإعلان",
                              color: Colors.black54);
                        } else
                          _adsProvider.addNewAd(context, images, formData);
                      }
                    },
                    width: 500,
                    horizontalMargin: 10,
                    radius: 7,
                    bgColor: Colors.green,
                  )
                ],
              ),
            ),
          ),
        ),
        if (_adsProvider.loading)
          Center(
            child: Card(
              child: Container(
                height: 120,
                  width: 120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: SpinKitRing(
                color: Colors.white,
                lineWidth: 10,
                duration: Duration(milliseconds: 600),
                size: 70,
              )),
            ),
          )
      ],
    );
  }

  buildPageItem(title, desc, param, {lines = 1, height = 60}) => Container(
        color: Colors.white,
        margin: EdgeInsets.all(18),
        height: height.toDouble(),
        width: double.infinity,
        child: TextFields(
          lable: desc,
          horizontalMargin: 0,
          maxLines: lines,
          keyboard: TextInputType.text,
          onChange: (v) {
            formData[param] = v.toString();
          },
          validator: (v) {
            if (v.toString().isEmpty) {
              return "";
            }
          },
        ),
      );

  buildFormItem(title, desc, onPress) => MaterialButton(
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
