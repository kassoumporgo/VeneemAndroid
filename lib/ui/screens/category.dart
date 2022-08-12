import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veneem/utils/icons.dart';
import 'package:veneem/ui/components/empty_list.dart';
import 'package:veneem/ui/components/list_item_content.dart';
import 'package:veneem/ui/components/separator.dart';
import '/ui/components/custom_app_bar.dart';
import '/ui/components/search_bar.dart';
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
                        title: _searchList[i]['name'],
                        subtitle: _searchList[i]['categorie_acte'],
                      )
                  ).onTap(
                    () => Get.to(
                      () => DetailsScreen(
                        act: _searchList[i],
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
          .where((data) => data['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();

    }

    setState(() {
      _searchList = results;
    });

  }


}
