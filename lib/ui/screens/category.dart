import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veneem/constants/icons.dart';
import 'package:veneem/ui/widgets/empty_list.dart';
import 'package:veneem/ui/widgets/list_item_content.dart';
import 'package:veneem/ui/widgets/separator.dart';
import '/ui/widgets/custom_app_bar.dart';
import '/ui/widgets/search_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import 'details.dart';


class CategoryScreen extends StatefulWidget {

  final List data;
  final String name;
  final IconData icon;

  const CategoryScreen({
    Key? key,
    required this.data,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  TextEditingController searchController = TextEditingController();

  List _searchList = [];

  @override
  void initState() {
    super.initState();
    _searchList = widget.data;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: CustomAppBar(text: widget.name, icon: widget.icon),

      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SearchBar(
                searchController: searchController,
                hintText: "Rechercher un acte ...",
                onChanged: (value) {
                  _filter(value);
                },
              ),
            ),

            Flexible(
              child: _searchList.isNotEmpty ? ListView.separated(
                itemCount: _searchList.length,
                itemBuilder: (ctx, i) {
                  return Container(
                      padding: contentPadding,
                      child: ListItemContent(
                        title: _searchList[i]['ACTE'],
                        subtitle: _searchList[i]['CATÉGORIE D’ACTES'],
                      )
                  ).onTap(
                    () => Get.to(
                      () => DetailsScreen(
                        actObject: _searchList[i],
                        act: _searchList[i]['ACTE'].toString(),
                        centers: _searchList[i]['TYPE DE CENTRE'].toString(),
                        cost: _searchList[i]['COÛT'].toString(),
                        receipt: _searchList[i]['QUITTANCE/REÇU/TIMBRE'].toString(),
                        finality: _searchList[i]['FINALITÉ'].toString(),
                        legal: _searchList[i]['BASE LÉGALE'].toString(),
                        validity: _searchList[i]['VALIDITÉ'].toString(),
                        actCategory: _searchList[i]['CATÉGORIE D’ACTES'].toString(),
                        delay: _searchList[i]['DÉLAI DE DÉLIVRANCE'].toString(),
                        dossier: _searchList[i]['DOSSIER'].toString(),
                        minCost: _searchList[i]['COÛT MINIMUM'].toString(),
                        maxCost: _searchList[i]['COÛT MAXIMUM'].toString(),
                        pageNumber: _searchList[i]['N° PAGE'].toString(),
                        source: _searchList[i]['SOURCE DES DONNÉES'].toString(),
                        costPrecision: _searchList[i]['PRÉCISION COÛT'].toString(),
                        lieuRetrait: _searchList[i]['LIEU DE RETRAIT'].toString(),
                      )
                    )
                  );
                },
                separatorBuilder: (ctx, i) {
                  return const Separator();
                },
              ) : const EmptyList(
                icon: emptyIcon,
                text: 'Données non disponible.',
              )
            ),

          ],
        ),
      ),

    );

  }


  void _filter(String query) {

    List results = [];

    if(query.isEmpty) {
      results = widget.data;
    } else {

      results = widget.data
          .where((data) => data['ACTE'].toLowerCase().contains(query.toLowerCase()))
          .toList();

    }

    setState(() {
      _searchList = results;
    });

  }


}
