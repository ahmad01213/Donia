import 'package:Donya/helpers.dart';

import 'Photo.dart';

class Ad{

  late int id;
  late int status;
  late  String title;
  late String description;
  late String phone;
  late String email;
  late double lat;
  late double lng;
  late String category;
  late String userId;
  late String subcategory;
  late List<Photo> photos=[];


  Ad.fromJson(Map<String, dynamic> data) {
    final json = data['ad'];
    id = json['id'];
    status = json['status'];
    title = json['title'];
    description = json['description'];
    phone = json['phone'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    category = json['category'];
    userId = json['user_id'];
    subcategory = json['subcategory'];
    print(data['photos']);
    data['photos'].forEach((element)=>photos.add(Photo.fromJson(element)));
  }
}