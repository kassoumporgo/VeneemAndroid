import 'package:flutter/material.dart';
import 'package:veneem/functions/date_format.dart';
import '../../utils/icons.dart';
import '/ui/components/empty_list.dart';
import '/ui/components/comment_item_content.dart';
import '/ui/components/separator.dart';
import '/ui/components/custom_app_bar.dart';


class CommentsList extends StatelessWidget {

  final List comments;

  const CommentsList({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: CustomAppBar(text: 'Différentes préoccupations'),

      body: comments.isNotEmpty ? ListView.builder(
        itemCount: comments.length,
        itemBuilder: (ctx, i) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(15.0)
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 16, bottom: 0.0, right: 16, left: 16),
            child: CommentItemContent(
              name: comments[i]['nom_et_prenoms'].toString() == '' ? 'ANONYME' : comments[i]['nom_et_prenoms'].toString().toUpperCase(),
              act: comments[i]['actes_concernes'][0],
              comment: comments[i]['commentaire'],
              date: dateFormat(date: comments[i]['added_on']),
            )
          );
        },
      ) : const EmptyList(
        icon: viewCommentsIcon,
        text: 'Pas encore de préoccupation signalée.',
      ),

    );

  }


}
