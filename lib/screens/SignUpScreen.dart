
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rafeeg/widgets/Texts.dart';
import 'package:rafeeg/widgets/btn_back.dart';


import '../shared_data.dart';
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                    },
                    password: true),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){

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
                            Text(
                              'إنشاء الحساب',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
