import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:veneem/utils/local_storage.dart';
import '../../api/services.dart';
import '/ui/components/drawer_content.dart';
import '../../utils/icons.dart';
import '../../utils/texts.dart';
import '/ui/components/empty_list.dart';
import '/ui/components/home_card.dart';
import '/ui/components/list_item_content.dart';
import '/ui/components/separator.dart';
import '/ui/components/search_bar.dart';
import '/utils/session_controller.dart';
import 'details.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController searchController = TextEditingController();
  bool _emptySearchQuery = true;


  List _searchList = [];


  @override
  void initState() {
    super.initState();
    ApiServices.getActs();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text(appName),
        elevation: 0.0,
        centerTitle: true,
      ),

      drawer: const Drawer(
        child: DrawerContent(),
      ),

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
              child: _emptySearchQuery ? Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeCard(data: LocalStorage.getHealthActs(), icon: AppIcon.health, name: 'Santé'),
                      20.height,
                      HomeCard(data: LocalStorage.getTownHallActs(), icon: AppIcon.townHall, name: 'Etat civil'),

                      70.height,

                      const Text(
                        "Taper un mot clé dans la barre de recherche pour rechercher un acte.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                ).center(),
              )
              : _searchList.isNotEmpty ? ListView.separated(
                  itemCount: _searchList.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      padding: contentPadding,
                      child: ListItemContent(
                        title: _searchList[i]['name'],
                        subtitle: _searchList[i]['categorie_acte'],
                      )
                    ).onTap(() => Get.to(() => DetailsScreen(act: _searchList[i]))
                    );
                  },
                  separatorBuilder: (ctx, i) {
                    return const Separator();
                  },
              ) : const EmptyList(
                icon: emptyIcon,
                text: 'Données non disponible.',
              ),
            ),

          ],
        ),
      ),

    );
  }



  void _filter(String query) {

    List results = [];

    if(query.isEmpty) {
      results = LocalStorage.getAllActs();
      setState(() {
        _emptySearchQuery = true;
      });
    } else {

      setState(() {
        _emptySearchQuery = false;
      });

      results = LocalStorage.getAllActs()
                  .where((data) => data['name'].toLowerCase().contains(query.toLowerCase()))
                  .toList();

    }

    setState(() {
      _searchList = results;
    });

  }

}

