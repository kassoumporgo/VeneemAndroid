import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veneem/ui/screens/intro.dart';
import '../ui/screens/splash_screen.dart';
import '/ui/screens/home.dart';
import 'session_controller.dart';



class Root extends StatelessWidget {

  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SessionController());

    return SimpleBuilder(builder: (_) {

      if (controller.isFirstTime) {
        return const IntroScreen();
      } else {
        return const SplashScreen();
      }

    });


  }
}



