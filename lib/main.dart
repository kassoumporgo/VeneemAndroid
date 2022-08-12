import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/ui/screens/intro.dart';
import '/utils/session_controller.dart';
import '/utils/root.dart';
import 'utils/colors.dart';
import '/ui/screens/home.dart';
import 'utils/texts.dart';



Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  final StreamSubscription<InternetConnectionStatus> listener =
  InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          log('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          log('You are disconnected from the internet.');
          break;
      }
    },
  );

  await Future<void>.delayed(const Duration(seconds: 2));
  await listener.cancel();

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final controller = Get.put(Controller());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: AppColor.main,
      ),
      // home: const HomeScreen(),
      home: const Root(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      locale: const Locale('FR'),
      supportedLocales: const [
        Locale('fr', 'FR'),
      ],
    );

  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
