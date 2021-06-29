import 'package:flutter/material.dart';
import 'package:rafeeg/screens/AddDetailPage.dart';
import 'package:rafeeg/widgets/Boxh10.dart';
import 'package:rafeeg/widgets/Texts.dart';
import 'package:rafeeg/widgets/btn_back.dart';
import 'package:rafeeg/widgets/home_slider.dart';

import '../shared_data.dart';

class AdsScreen extends StatelessWidget {
  String title;

  AdsScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: Texts(
          title: title,
          fSize: 22,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: BtnBack(context),
      ),
      body: Container(
        color: Colors.green.withOpacity(0.05),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 11,
            itemBuilder: (context, index) {
              return index == 0
                  ? Container(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "  ابحث في النتائج  ",
                            hintStyle:
                                TextStyle(fontSize: 20, color: greyyColor)),
                      ),
                    )
                  : MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed: (){
                  pushPage(context, AddDetailPage());
                },
                    child: Container(
                        width: double.infinity,
                        child: Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  child: HomeSlider(
                                    imagesUrlList: [
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCw1_GynZjsPGWGTWDx-WYlJn8ebjbIU8N_A&usqp=CAU',
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnhmHo64RO9qsOc14rSwptIcOPUb-_q7Bhtg&usqp=CAU'
                                    ],
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 0.45,
                                    autoPlay: false,
                                  )),
                              Boxh10(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Texts(
                                  lines: 2,
                                  title:
                                      "من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل من المتحده جروب : سيات ابيزا 2021 اقل مقدم اقل فايده6.8٪؜ وبدون عمل",

                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  );
            }),
      ),
    );
  }
}
