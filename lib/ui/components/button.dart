import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/colors.dart';


class FilledButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const FilledButton({
    required this.text,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
      ),
      // elevation: 1.3,
      elevation: .5,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: boxDecorationWithShadow(
          borderRadius: BorderRadius.circular(50.0),
          spreadRadius: 0.0,
          blurRadius: 0.0,
          backgroundColor: mainColor,
          border: Border.all(color: mainColor, width: 1.5),
        ),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            // color: whiteColor,
            color: whiteColor,
            fontSize: 16,
          ),
        ),
      ),
    ).paddingAll(6.0).onTap(onPressed, borderRadius: BorderRadius.circular(50.0));
  }
}