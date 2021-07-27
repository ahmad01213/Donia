import '../helpers.dart';

class Photo{

 late String url;
  Photo.fromJson(json){
    url = filesUrl+json['url'].toString();
  }
}