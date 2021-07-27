import 'dart:convert';

import 'package:Donya/Helpers/Functions.dart';
import 'package:Donya/Models/User.dart';
import 'package:Donya/screens/SignInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../helpers.dart';

class AuthProvider extends ChangeNotifier{

  bool loading = false;
  login({context,params}) async {
      loading = true;
      notifyListeners();
      notifyListeners();
      final url = "$baseUrl/login";
      final response = await http.post(Uri.parse(url), body: params);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        user = User.fromJson(data['user']);
        token = "Bearer "+data['token'].toString();
        saveToken();
        pop(context);
      } else {
        HelperFunctions.slt.notifyUser(context: context,message: "رقم الهاتف أو كلمة المرور غير صحيحة",color: Colors.red);
      }
      loading = false;
      notifyListeners();
  }

  register({context,params}) async {
    loading = true;
    notifyListeners();
    notifyListeners();
    final url = "$baseUrl/register";
    final response = await http.post(Uri.parse(url), body: params);
    print(response.body);
    if (response.statusCode == 200) {
      await login(context: context,params: params);
      pop(context);
    } else {
      HelperFunctions.slt.notifyUser(context: context,message: "الحساب مسجل من قبل",color: Colors.red);
    }

  }

}