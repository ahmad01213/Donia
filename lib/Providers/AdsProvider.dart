import 'dart:convert';
import 'dart:io';

import 'package:Donya/Models/Ad.dart';
import 'package:Donya/screens/AddedSucess.dart';
import 'package:flutter/cupertino.dart';

import '../helpers.dart';
import 'package:http/http.dart' as http;
class AdsProvider extends ChangeNotifier{
  List<Ad> userAds = [];
  getUserAds() async {
    userAds=[];
    loading = true;
    final url = "$baseUrl/get-user-ads";
    final headers = {
      'Authorization': token,
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      userAds=[];
      List data = jsonDecode(response.body);
      data.forEach((element) {
        userAds.add(Ad.fromJson(element));
      });
    } else {
    }
    loading = false;
    notifyListeners();
  }

  List<Ad> searchAds = [];
  getSearchAds(search) async {
    searchAds=[];
    loading = true;
    final url = "$baseUrl/get-search-ads";
    final params = {
      'search':search
    };
    final response = await http.post(Uri.parse(url), body: params);
    if (response.statusCode == 200) {
      print(response.body);
      searchAds=[];
      List data = jsonDecode(response.body);
      data.forEach((element) {
        searchAds.add(Ad.fromJson(element));
      });
    } else {
    }
    loading = false;
    notifyListeners();
  }



  List<Ad> categoryAds = [];
  getAdsByCategory({params}) async {
    print(params);
    categoryAds=[];
    loading = true;
    final url = "$baseUrl/get-category-ads";
    final response = await http.post(Uri.parse(url), body: params);
    print(response.body);
    if (response.statusCode == 200) {
      categoryAds=[];

      List data = jsonDecode(response.body);
       data.forEach((element) {
         categoryAds.add(Ad.fromJson(element));
       });
    } else {
    }
    loading = false;
    notifyListeners();
  }

  bool loading = false;
  addNewAd(context,List<File> images, params) async {
    loading = true;
    notifyListeners();
    final url = "${baseUrl}/add-ad";
    final headers = {
      'Authorization': token,
    };
    var request = http.MultipartRequest("POST", Uri.parse(url));
    // request.headers.addAll(headers);
    request.fields.addAll(params);
    request.headers.addAll(headers);
    images.forEach((img) async {
      var multipartFile = await http.MultipartFile.fromPath(
        "images",
        img.path,
      );
      request.files.add(multipartFile);
    });
    http.StreamedResponse response = await request.send();
    var responses = await http.Response.fromStream(response);

    print('body ${responses.body}');
    if (response.statusCode == 200) {
      replacePage(context, SuccessAdd());
      getUserAds();
    } else {
    }
    loading= false;
    notifyListeners();

  }
}