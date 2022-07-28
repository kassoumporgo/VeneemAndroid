import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


EdgeInsets contentPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 10);


class ListItemContent extends StatelessWidget {

  final String title;
  final String subtitle;

  const ListItemContent({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),

        7.height,

        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),

      ],
    );
  }
}
