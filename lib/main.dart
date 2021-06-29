import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rafeeg/screens/Home.dart';
import 'package:rafeeg/screens/StartScreen.dart';
import 'package:rafeeg/shared_data.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path:
        'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('ar', ''),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.locale = Locale('ar');
    return MaterialApp(
      title: 'رفيق',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(

        primaryColor: mainColor

      ),
      home: StartScreen(),
    );
  }
}

