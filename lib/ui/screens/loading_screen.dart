import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/utils/colors.dart';

class LoadingScreen extends StatefulWidget {

  final Future<void> init;
  final String text;

  const LoadingScreen({
    Key? key,
    required this.init,
    required this.text,
  }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    widget.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            CircularProgressIndicator(color: AppColor.main),
            15.height,
            Text(
              "Un instant",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColor.main,
              ),
            ),

            5.height,

            Text(
              widget.text,
              style: const TextStyle(
                // fontWeight: FontWeight.w400,
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
