import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';



class CustomAppBar extends AppBar {

  final String text;
  final IconData? icon;

  CustomAppBar({
    Key? key,
    required this.text,
    this.icon,
  }) : super(
    key: key,
    title: icon != null ? Row(
      children: [
        Icon(icon),
        10.width,
        Text(text),
      ],
    ) : Text(text),
    elevation: 0.0,
  );

}