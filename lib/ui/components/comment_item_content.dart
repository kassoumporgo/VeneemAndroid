import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/utils/colors.dart';



class CommentItemContent extends StatelessWidget {

  final String name;
  final String comment;
  final String date;
  final String act;

  const CommentItemContent({
    Key? key,
    required this.name,
    required this.comment,
    required this.date,
    required this.act,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),

        7.height,
        Text(
          act,
          style: const TextStyle(
            fontSize: 17,
            color: mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        7.height,

        Text(
          comment,
          style: const TextStyle(
            // fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),

        7.height,

        Text(
          date,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

      ],
    );
  }
}
