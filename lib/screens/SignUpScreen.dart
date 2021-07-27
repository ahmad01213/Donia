
import 'package:Donya/Providers/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Donya/widgets/Texts.dart';
import 'package:Donya/widgets/btn_back.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../helpers.dart';
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final Map<String, dynamic> formData = {};
  final formKey= GlobalKey<FormState>();
  var _authProvider;
  @override
  Widget build(BuildContext context) {
    if(_authProvider==null){
      _authProvider=Provider.of<AuthProvider>(context);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
   elevation: 1,
        leading: BtnBack(context,color: Colors.black,),
        brightness: Brightness.dark,
        title:  Texts(
         title: "حساب دنيا",
          color: Colors.black,
          fSize: 22,
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(child: Image.asset('assets/images/logo.png',height: 100,)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'الحساب',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: mainColor),
                ),
                Text(
                  'إنشاء حساب جديد',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.orange),
                ),
                SizedBox(
                  height: 20,
                ),
                textFromField(
                    hint: 'الاسم بالكامل',
                    icon: Icons.account_circle,
                    inputType: TextInputType.text,
                    onChange: (value){
                      formData['name'] = value.toString();
                    },
                    password: false),
                SizedBox(
                  height: 20,
                ),
                textFromField(
                    hint: 'البريد الإلكتروني',
                    icon: Icons.account_circle,
                    inputType: TextInputType.text,
                    onChange: (value){
                      formData['email'] = value.toString();
                    },
                    password: false),
                SizedBox(
                  height: 20,
                ),
                textFromField(
                    hint: ' رقم الهاتف',
                    icon: Icons.phone_android,
                    inputType: TextInputType.phone,
                    onChange: (value){
                      formData['phone'] = value.toString();
                    },
                    password: false),
                SizedBox(
                  height: 20,
                ),
                textFromField(
                    hint: ' كلمة المرور',
                    icon: Icons.remove_red_eye,
                    inputType: TextInputType.visiblePassword,
                    onChange: (value){
                      formData['password'] = value.toString();                    },
                    password: true),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                  _authProvider.register(context: context,params: formData);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [mainColor.withOpacity(0.7), mainColor])),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'إنشاء الحساب',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),

                                SizedBox(width: 20,),
                                if (_authProvider.loading)SpinKitRing(color: Colors.white,lineWidth: 3,duration: Duration(milliseconds: 600),size: 25,)
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
          validator: (v){
            if(v.toString().isEmpty){
              return "الرجاء كتابة "+ hint;
            }
            return null;
          },
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
}
