import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nb_utils/nb_utils.dart';
import '/ui/widgets/drawer_content.dart';
import '/constants/icons.dart';
import '/constants/texts.dart';
import '/ui/widgets/empty_list.dart';
import '/ui/widgets/home_card.dart';
import '/ui/widgets/list_item_content.dart';
import '/ui/widgets/separator.dart';
import '/ui/widgets/search_bar.dart';
import '/utils/controller.dart';
import 'details.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController searchController = TextEditingController();
  bool _emptySearchQuery = true;


  List _allData = [];
  final List _townHallData =  [];
  final List _healthData =  [];

  List _searchList = [];
  List _localHealthList = [];
  List _localTownHallList = [];


  Future<void> _fetchData() async {

    /// => Récuperer tous les actes
    // const _url = 'https://raw.githubusercontent.com/kassoumporgo/data/d9d24febe18a71337668666d07e875d6a6d07f4d/Data.json';
    // final response = await http.get(Uri.parse(_url));
    final response = await http.get(Uri.parse(dbUrl));
    final data = await json.decode(response.body);
    setState(() {
      _allData = data;
    });


    /// => Actes de la SANTE

    if (_allData.isNotEmpty) {
      for(var data in _allData) {
        if (
          data['SOURCE DES DONNÉES'].toString().contains('SANTÉ') ||
          data['SOURCE DES DONNÉES'].toString().contains('SANTE')
        ) {
          setState(() {
            _healthData.add(data);
          });
        }
      }
    }


    /// => Actes de la MAIRIE

    if (_allData.isNotEmpty) {
      for(var data in _allData) {
        if (data['TYPE DE CENTRE'].toString().contains('MAIRIE')) {
          setState(() {
            _townHallData.add(data);
            // box.write('townHallData', _townHallData);
          });
        }
      }
    }


    /// => Enregistrer les données en local

    setState(() {
      box.write('allData', _allData);
      box.write('healthData', _healthData);
      box.write('townHallData', _townHallData);
    });


  }


  // Future<void> _init() async {
  //
  //   bool hasInternetConnection = await InternetConnectionChecker().hasConnection;
  //
  //   if(hasInternetConnection) {
  //
  //     Duration interval = const Duration(seconds: 1);
  //     Stream<int> stream = Stream<int>.periodic(interval, (it)=>it+1);
  //     await for(int i in stream) {
  //       print(i);
  //       setState(() => _fetchData());
  //     }
  //
  //   }
  //
  // }


  @override
  void initState() {
    super.initState();
    _fetchData();
    // _init();
  }


  @override
  Widget build(BuildContext context) {

    setState(() {
      List allData = box.read('allData');
      List healthData = box.read('healthData');
      List townHallData = box.read('townHallData');

      _searchList = allData;
      _localHealthList = healthData;
      _localTownHallList = townHallData;

      log('***********************************************');
      log(_searchList.toString());
      log('----------------------------------------');
      log(_localHealthList.toString());
      log('----------------------------------------');
      log(_localTownHallList.toString());
      log('***********************************************');
    });

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
                      HomeCard(data: _localHealthList, icon: AppIcon.health, name: 'Santé'),
                      20.height,
                      HomeCard(data: _localTownHallList, icon: AppIcon.townHall, name: 'Etat civil'),

                      70.height,

                      const Text(
                        // "Transparence - Participation citoyenne",
                        "Taper un mot clé dans la barre de recherche pour rechercher un acte.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
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
      results = _healthData;
      setState(() {
        _emptySearchQuery = true;
      });
    } else {

      setState(() {
        _emptySearchQuery = false;
      });

      results = _healthData
                  .where((data) => data['ACTE'].toLowerCase().contains(query.toLowerCase()))
                  .toList();

    }

    setState(() {
      _searchList = results;
    });

  }

}

