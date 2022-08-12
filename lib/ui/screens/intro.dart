import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/ui/screens/home.dart';
import '../../api/services.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';


import 'package:flutter/foundation.dart';

import 'loading_screen.dart';


class IntroScreen extends StatefulWidget {

  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final introKey = GlobalKey<IntroductionScreenState>();





  Future<void> _onIntroEnd(context) async {

    Get.to(()=> LoadingScreen(
      init: ApiServices.login(),
      text: "Récupération des données ...",
    ));

    // getActs();
    // getConcerns();
    // loginAndGetToken();

  }



  @override
  Widget build(BuildContext context) {

    const bodyStyle = TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,

      globalFooter: Container(
        margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          child: Text(
            'commencer à découvrir'.toUpperCase(),
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),

      pages: [

        PageViewModel(
          title: "Actes de santé",
          body: "Récapitulatif de tous les actes de santé accessible dans les services de santé publique comme les CMA, CSPS, et CHU.",
          image: const Icon(AppIcon.health, color: AppColor.main, size: 120),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Actes de Mairie",
          body: "Récapitulatif de tous les services accessibles au niveau des mairies",
          image: const Icon(AppIcon.townHall, color: AppColor.main, size: 120),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Signaler une irrégularité",
          body: "En tant que citoyens il est de notre devoir de dénoncer tout actes de corruption ou d'irrégularité lier à l'accès aux services publics.",
          image: const Icon(AppIcon.submitComment, color: AppColor.main, size: 120),
          decoration: pageDecoration,
        ),

      ],
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: false,
      showNextButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

    );
  }
}


class LoadData extends StatefulWidget {


  const LoadData({Key? key}) : super(key: key);

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {

  @override
  void initState() {
    ApiServices.getActsAndGoToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            CircularProgressIndicator(color: AppColor.main),
            10.height,
            Text(
              "Un instant",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: AppColor.main,
              ),
            ),

            5.height,

            Text(
              "Chargement",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: AppColor.main,
              ),
            ),

          ],
        ),
      ).center(),
    );
  }
}

