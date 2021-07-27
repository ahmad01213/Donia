import 'package:Donya/Providers/AdsProvider.dart';
import 'package:Donya/Providers/AuthProvider.dart';
import 'package:Donya/screens/addad.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Donya/screens/Home.dart';
import 'package:Donya/screens/StartScreen.dart';
import 'package:Donya/shared_data.dart';
import 'package:provider/provider.dart';

import 'helpers.dart';

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
    return MultiProvider(

      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<AdsProvider>(create: (context) => AdsProvider()),
      ],
      child: MaterialApp(

        title: 'دنيا',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(

          primaryColor: mainColor

        ),
        home: StartScreen(),
      ),
    );
  }
}

