import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://images-platform.99static.com//BRB0no_gfV-KFPWnV7Su5Jqr5yQ=/0x0:2040x2040/fit-in/500x500/99designs-contests-attachments/96/96946/attachment_96946058",
                  height: 150,
                  width: 150,
                ))),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
