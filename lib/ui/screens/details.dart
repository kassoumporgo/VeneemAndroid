import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/constants/texts.dart';
import 'package:veneem/ui/screens/submit_comment.dart';
import 'package:veneem/ui/widgets/button.dart';
import '/ui/widgets/custom_app_bar.dart';




class DetailsScreen extends StatelessWidget {

  final Map actObject;
  final String act;
  final String actCategory;
  final String centers;
  final String cost;
  final String receipt;
  final String validity;
  final String finality;
  final String legal;
  final String delay;
  final String dossier;
  final String source;
  final String lieuRetrait;
  final String costPrecision;
  final String minCost;
  final String maxCost;
  final String pageNumber;

  const DetailsScreen({
    Key? key,
    required this.actObject,
    required this.act,
    required this.actCategory,
    required this.centers,
    required this.cost,
    required this.receipt,
    required this.validity,
    required this.finality,
    required this.legal,
    required this.delay,
    required this.dossier,
    required this.source,
    required this.lieuRetrait,
    required this.costPrecision,
    required this.minCost,
    required this.maxCost,
    required this.pageNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(text: act),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            8.height,

            customColumn(label: "Catégorie d'acte", text: actCategory),
            customColumn(label: "Acte", text: act),
            customRow(label: centers.toString().contains(',') ? "Centres" : "Centre", text: centers.replaceAll('[', '').replaceAll(']', '')),
            customRow(label: "COÛT", text: cost+' '+currency),
            customColumn(label: "PRÉCISION COÛT", text: costPrecision),
            customColumn(label: "COÛT MINIMUM", text: minCost),
            customColumn(label: "COÛT MAXIMUM", text: maxCost),
            customColumn(label: "QUITTANCE/REÇU/TIMBRE", text: receipt),
            customColumn(label: "Validité", text: validity),
            customColumn(label: "DOSSIER", text: dossier.toString()),
            customColumn(label: "DÉLAI DE DÉLIVRANCE", text: delay),
            customColumn(label: "LIEU DE RETRAIT", text: lieuRetrait),
            customColumn(label: "Finalité", text: finality),
            customColumn(label: "Base légale", text: legal),
            customColumn(label: "SOURCE", text: source+' (Page $pageNumber)'),

            SizedBox(
              width: MediaQuery.of(context).size.width*.9,
              child: FilledButton(
                text: "soumettre une préoccupation",
                onPressed: ()=> Get.to(()=> SubmitComment(act: actObject)),
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
