import 'package:Donya/Models/Ad.dart';
import 'package:Donya/Providers/AdsProvider.dart';
import 'package:Donya/widgets/SizedBoxWidget.dart';
import 'package:flutter/material.dart';
import 'package:Donya/screens/AddDetailPage.dart';
import 'package:Donya/widgets/Boxh10.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:Donya/widgets/btn_back.dart';
import 'package:Donya/widgets/home_slider.dart';
import 'package:provider/provider.dart';
import '../helpers.dart';
class SearchScreen extends StatelessWidget {
  late AdsProvider _adsProvider;
  bool start = true;
  @override
  Widget build(BuildContext context) {
    if(start){
      _adsProvider = Provider.of<AdsProvider>(context);
      start = false;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: false,
        title: Texts(
          title: "ابحث عن إعلانك",
          fSize: 22,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
        leading: BtnBack(context),
      ),
      body: Container(
        color: Colors.green.withOpacity(0.05),
        child: Column(
          children: [
            TextFormField(
              onChanged: (v){
                _adsProvider.getSearchAds(v.toString());
              },
              decoration: InputDecoration(
                  hintText: "اكتب  ما  تبحث عنه ؟  ",
                  hintStyle: TextStyle(fontSize: 20, color: greyyColor)),
            ),
            Box(30),
            ListView.builder(
                shrinkWrap: true,
                itemCount: _adsProvider.searchAds.length,
                itemBuilder: (context, index) {
                  Ad ad = _adsProvider.searchAds[index];
                  return MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: (){
                      pushPage(context, AddDetailPage(ad));
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
                                  imagesUrlList: ad.photos.map((element)=>element.url).toList(),
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
                                  title:ad.description

                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
