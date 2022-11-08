import 'package:amoi/componantes/colors.dart';
import 'package:amoi/screen/screen_dashboard.dart';
import 'package:amoi/screen/screen_seconnect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FIREBASE
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // run APP
  runApp(const MyApp());

  // loading
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = colorPrimary
    ..backgroundColor = colorSecondary
    ..indicatorColor = colorPrimary
    ..textColor = colorPrimary
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: colorPrimaryBg,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amoi Groupe',
        theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder()
            }),
            primaryColor: Colors.black),
        builder: EasyLoading.init(),
        initialRoute: '/seconnect',
        routes: {
          '/seconnect': (context) => const ScreenSeConnect(),
          '/dashboard': (context) => const ScreenDashboard(),
        });
  }
}
