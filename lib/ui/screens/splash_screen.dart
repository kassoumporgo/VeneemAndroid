import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/utils/colors.dart';
import 'package:veneem/ui/screens/home.dart';

import '../../utils/texts.dart';



class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {


  Future<void> _init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    Get.offAll(()=> const HomeScreen());
  }



  @override
  void initState() {
    super.initState();
    _init();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColor.main,

      body: Stack(
        fit: StackFit.expand,
        children: [

           SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  appName,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                ),
                20.height,
                const Text(
                  "Transparence & participation citoyenne",
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.w600,
                    color: AppColor.white,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ).center(),

          Positioned(
            bottom: 00,
            left: 00,
            right: 00,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                20.width,
                Text(
                  "Chargement ...",
                  style: primaryTextStyle(
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ).paddingBottom(30.0),
          ),

        ],
      ),
    );
  }
}