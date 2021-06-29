import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;
import 'package:rafeeg/screens/SignUpScreen.dart';
import '../shared_data.dart';
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final Map<String, dynamic> formData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'الحساب',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color:mainColor),
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.orange),
                    ),
                  ],),
                  Center(
                  //     child:
                  // Image.asset('assets/images/logo.png',height: 100,width: 80,)
                  ),

                ],
              ),

              SizedBox(
                height: 20,
              ),
              textFromField(
                  hint: 'اكتب رقم الهاتف',
                  icon: Icons.phone_android,
                  inputType: TextInputType.phone,
                  onChange: (value) {
                    formData['phone'] = value;
                  },
                  password: false),
              SizedBox(
                height: 20,
              ),
              textFromField(
                  hint: 'اكتب كلمة المرور',
                  icon: Icons.remove_red_eye,
                  inputType: TextInputType.visiblePassword,
                  onChange: (value) {
                    formData['password'] = value;
                  },
                  password: true
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFf1c40f), Color(0xFFf39c12)])),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('الدخول', style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,
                          color: Colors.white),),
                      SizedBox(
                        width: 10,
                      ),
                      isloading
                          ? SpinKitRing(
                        size: 15,
                        color: Colors.white,
                        lineWidth: 2,
                        duration: Duration(milliseconds: 700),
                      )
                          : Container()
                    ],
                  )),
                ),
              ),
              SizedBox(height: 20,),

//            InkWell(
//              onTap: (){
//                navigateTo(context: context,page: ForgetPassword());
//              },
//              child: Text(
//                'نسيت كلمة المرور ؟',
//
//                style: TextStyle(
//                    fontSize: 17,
//                    decoration: TextDecoration.underline,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.blueAccent),
//              ),
//            ),
              SizedBox(height: 20,),

              InkWell(
                onTap: () {
                  pushPage(context, RegisterScreen());
                },
                child: Center(
                  child: Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Center(
                child: Text(
                  'أو',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
              ),
              SizedBox(height: 10,),
              buildSocialLoginBtn(
                  'التسجيل عبر جوجل',Colors.red, Colors.white,Colors.white,
                  'assets/images/google.png', loginWithGoogle),
              buildSocialLoginBtn(
                  'التسجيل عبر فيسبوك',Colors.indigo, Colors.white,Colors.white,
                  'assets/images/facebook.png', loginWithFacebook),
              // buildSocialLoginBtn("التسجيل عبر Apple", Colors.black, Colors.white, Colors.white, 'assets/apple.png', loginApple)
            ],
          ),
        ),
      ),
    );
  }

  loginApple() async {
    // final credential = await SignInWithApple.getAppleIDCredential(
    //   scopes: [
    //     AppleIDAuthorizationScopes.email,
    //     AppleIDAuthorizationScopes.fullName,
    //   ],
    // );
    //
    // print(credential);
  }
  textFromField({password, hint, icon, inputType, onChange, initialValue}) {
    return Container(
      height: 60.0,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
      padding: EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
      child: Theme(
        data: ThemeData(
          hintColor: Colors.transparent,
        ),
        child: TextFormField(
          obscureText: password,
          initialValue: initialValue,
          onChanged: onChange,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: hint,
              icon: Icon(
                icon,
                color: Colors.black38,
              ),
              labelStyle: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Sans',
                  letterSpacing: 0.3,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600)),
          keyboardType: inputType,
        ),
      ),
    );
  }

  bool isloading = false;
  facebookLogin(params) async {
//     params['device_token'] = 'and';
//     try {
//       final Uri url =
//       Uri.parse("${baseUrl}facebook-login");
//       final response = await http.post(
//         url,
//         body: params,
//       );
//       print("response : ${response.body}");
//       final jsonData = json.decode(response.body) as Map<String, dynamic>;
//       token = 'Bearer ${jsonData['success']['token']}';
//       print("tokens  :  ${jsonData['success']['token']}");
//       user = User(
//           name: jsonData['success']['name'],
//           email: jsonData['success']['email'],
//           phone: jsonData['success']['phone']);
//       saveToken();
//       if (widget.update != null) {
//         widget.update();
//         return;
//       }
// //      showSnackBar("شكرا لك تم تسجيل الدخول بنجاح",context);
//     } catch (error) {
    }
  }

  loginWithGoogle() async {
//     GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
//       'email',
//       'profile',
//     ]);
//     _googleSignIn.signOut();
//     GoogleSignInAccount googleuser = await _googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication =
//     await googleuser.authentication;
//     var params = Map();
//     print('email : ${googleuser.email}');
//     params['email']=googleuser.email;
//     params['name']=googleuser.displayName;
//     params['device_token']='abc';
//     params['id']=googleSignInAuthentication.accessToken;
//
//     final Uri url =
//     Uri.parse(baseUrl+'google-login');
//     final response = await http.post(
//       url,
//       body: params,
//     );
//     print("response : ${response.body}");
//     final jsonData = json.decode(response.body) as Map<String, dynamic>;
//     token = 'Bearer ${jsonData['success']['token']}';
//     print("tokens  :  ${jsonData['success']['token']}");
//     user = User(
//         name: jsonData['success']['name'],
//         email: jsonData['success']['email'],
//         phone: jsonData['success']['phone']);
//     saveToken();
//     if (widget.update != null) {
//       widget.update();
//       return;
//     }
// //      showSnackBar("شكرا لك تم تسجيل الدخول بنجاح",context);
//     setState(() {
//       isloading = false;
//     });

  }
  loginWithFacebook() async {
//     final facebookLogin = FacebookLogin();
//     await facebookLogin.logOut();
//     final result = await facebookLogin.logIn([
//       'email'
//     ]);
//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         var params = Map();
//         final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${result.accessToken.token}');
//         final profile = jsonDecode(graphResponse.body);
//         params['email']=profile['email']??'facebook@mail.com';
//         params['name']=profile['name'];
//         print(' profile  :  ${profile}');
//         params['device_token']='abc';
//         params['facebook_id']=result.accessToken.userId;
//         final Uri url =
//         Uri.parse(baseUrl+'facebook-login');
//         final response = await http.post(
//           url,
//           body: params,
//         );
//         print("response : ${response.body}");
//         final jsonData = json.decode(response.body) as Map<String, dynamic>;
//         token = 'Bearer ${jsonData['success']['token']}';
//         print("tokens  :  ${jsonData['success']['token']}");
//         user = User(
//             name: jsonData['success']['name'],
//             email: jsonData['success']['email'],
//             phone: jsonData['success']['phone']);
//         saveToken();
//         if (widget.update != null) {
//           widget.update();
//           return;
//         }
// //      showSnackBar("شكرا لك تم تسجيل الدخول بنجاح",context);
//         setState(() {
//           isloading = false;
//         });
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         break;
//       case FacebookLoginStatus.error:
//         print(' errrrrrrrrr  :  ${result.errorMessage}');
//         break;
//     }
  }
  buildSocialLoginBtn(text, color, textColor,iconColor, image, press,) {
    return InkWell(
      onTap: (){
        press();
      },
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0,0.9, ), //(x,y)
              blurRadius: 0.1,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset(image, height: 30, width: 30,color: iconColor, )
            ,
            SizedBox(width: 30,),
            Text(
              text,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: textColor),
            ),
          ],
        ),
      ),
    );
  }

