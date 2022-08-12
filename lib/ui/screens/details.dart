import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/utils/texts.dart';
import 'package:veneem/ui/screens/submit_comment.dart';
import 'package:veneem/ui/components/button.dart';
import '/ui/components/custom_app_bar.dart';




class DetailsScreen extends StatelessWidget {

  final Map act;

  const DetailsScreen({
    Key? key,
    required this.act,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(text: act['name']),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            8.height,

            customColumn(label: "Catégorie d'acte", text: act['categorie_acte']),
            customColumn(label: "Acte", text: act['name']),
            customRow(label: act['types_de_centre'].toString().contains(',') ? "Centres" : "Centre", text: act['types_de_centre'].toString().replaceAll('[', '').replaceAll(']', '')),
            customRow(label: "COÛT", text: act['cout']+' '+currency),
            customColumn(label: "PRÉCISION COÛT", text: act['precision_cout']),
            customColumn(label: "COÛT MINIMUM", text: act['cout_minimum']),
            customColumn(label: "COÛT MAXIMUM", text: act['cout_maximum']),
            customColumn(label: "QUITTANCE/REÇU/TIMBRE", text: act['quittance_recu_timbre']),
            customColumn(label: "Validité", text: act['validite']),
            customColumn(label: "DOSSIER", text: act['dossier']),
            customColumn(label: "DÉLAI DE DÉLIVRANCE", text: act['delai_de_delivrance']),
            customColumn(label: "LIEU DE RETRAIT", text: act['lieu_de_retrait']),
            customColumn(label: "Finalité", text: act['finalite']),
            customColumn(label: "Base légale", text: act['base_legale']),
            customColumn(label: "SOURCE", text: act['source_des_donnees']+' (Page ${act['page_number']})'),

            SizedBox(
              width: MediaQuery.of(context).size.width*.9,
              child: FilledButton(
                text: "soumettre une préoccupation",
                onPressed: ()=> Get.to(()=> SubmitComment(act: act)),
              ),
            ).center().paddingOnly(bottom: 16, top: 20),

          ],
        ),
      ),

    );
  }

  Widget customRow({required String label, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase()+" :",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.width,
          Text(
            text,
            style: const TextStyle(
              fontSize: 17,
            ),
          ).expand(),
        ],
      ),
    ).visible(text.isNotEmpty && text != 'nan');
  }

  Widget customColumn({required String label, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          5.height,
          Text(
            text,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    ).visible(text.isNotEmpty && text != 'nan');
  }

}
