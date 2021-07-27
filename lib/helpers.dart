

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Models/User.dart';

String token="";
String  baseUrl="https://c1fa540c3498.ngrok.io";
String  filesUrl="https://c1fa540c3498.ngrok.io/uploads/";


const mainColor = Color(0xff535c68);
const secondColor = Colors.orange;
const greyyColor = Colors.grey;

replacePage(context, page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

pushPage(context, page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}


User user = User();

saveToken() {
  final storage = new FlutterSecureStorage();
  storage.write(key: 'token', value: token);
  storage.write(key: 'id', value: user.id);
}

isRegistered() {
  return token != "";
}

signOut({ctx, page}) async {
  final storage = new FlutterSecureStorage();

  token = "";
  user= User();
  await storage.delete(key: "token");
}


readToken() async {
  final storage = new FlutterSecureStorage();
  token = (await storage.read(key: "token"))!;
  print("token : $token");
}

saveValue(key, value) {
  final storage = new FlutterSecureStorage();
  storage.write(key: key, value: value);
}

pop(context) {
  Navigator.of(context).pop();
}
