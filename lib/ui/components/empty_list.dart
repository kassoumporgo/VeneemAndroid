import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/icons.dart';


class EmptyList extends StatelessWidget {

  final IconData icon;
  final String text;

  const EmptyList({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Icon(icon, size: 160, color: Colors.grey.shade400),

          20.height,

          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ).center();
  }
}