import 'package:flutter/material.dart';
import 'package:veneem/functions/date_format.dart';
import '/constants/icons.dart';
import '/ui/widgets/empty_list.dart';
import '/ui/widgets/comment_item_content.dart';
import '/ui/widgets/separator.dart';
import '/ui/widgets/custom_app_bar.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List _commentList = [

      {
        "id": 1,
        "nom_et_prenoms": 'Kassoum',
        "telephone": "70000000",
        "email": "mail@mail.com",
        "titre": "Cout de l'accouchement",
        "commentaire": "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor amet magnam, nulla "
            "libero iure laborum, est dolorum laboriosam, tenetur ex nam quos illo quia doloribus "
            "porro voluptatibus ullam deleniti quod.",
        "added_on": "2022-03-10T12:46:11.470547Z",
        "actes_concernes": {
          "id": 1,
          "page_number": 23,
          "name": "Acte d'imagerie",
          "description": "",
          "finalite": "",
          "dossier": "",
          "cout": 10000,
          "cout_minimum": "",
          "cout_maximun": "",
          "precision_cout": "",
          "validide": "Pour un acte",
          "centres": "",
          "source": "",
          "base_legale": "",
          "lieu_retrait": "",
          "quittance_recu_timbre": "",
        }
      },

      {
        "id": 1,
        "nom_et_prenoms": '',
        "telephone": "",
        "email": "",
        "titre": "RX THORAX",
        "commentaire": "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor amet magnam, nulla "
            "libero iure laborum, est dolorum laboriosam, tenetur ex nam quos illo quia doloribus "
            "porro voluptatibus ullam deleniti quod.",
        "added_on": "2022-03-10T12:46:11.470547Z",
        "actes_concernes": {
          "id": 3,
          "page_number": 23,
          "name": "Acte d'imagerie Medical",
          "description": "",
          "finalite": "",
          "dossier": "",
          "cout": 10000,
          "cout_minimum": "",
          "cout_maximun": "",
          "precision_cout": "",
          "validide": "Pour un acte",
          "centres": "",
          "source": "",
          "base_legale": "",
          "lieu_retrait": "",
          "quittance_recu_timbre": "",
        }
      },

    ];

    return Scaffold(

      appBar: CustomAppBar(text: 'Différentes préoccupations'),

      body: _commentList.isNotEmpty ? ListView.builder(
        itemCount: _commentList.length,
        itemBuilder: (ctx, i) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(15.0)
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 16, bottom: 0.0, right: 16, left: 16),
            child: CommentItemContent(
              name: _commentList[i]['nom_et_prenoms'].toString() == '' ? 'ANONYME' : _commentList[i]['nom_et_prenoms'].toString().toUpperCase(),
              act: _commentList[i]['actes_concernes']['name'],
              comment: _commentList[i]['commentaire'],
              date: dateFormat(date: _commentList[i]['added_on']),
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
