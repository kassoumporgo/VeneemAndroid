import 'dart:developer';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:veneem/api/comment_model.dart';
import 'package:veneem/api/user_model.dart';

import '../functions/toasts.dart';
import '../ui/screens/comments_list.dart';
import '../ui/screens/home.dart';
import '../ui/screens/intro.dart';
import '../utils/session_controller.dart';
import '../utils/local_storage.dart';
import 'controller.dart';



class ApiServices {

  static Future<void> login() async {

    var user = UserModel(username: "yeeli", password: "YeeliAdmin123");

    bool hasInternetConnection = await InternetConnectionChecker().hasConnection;

    if (!hasInternetConnection) {
      noConnexionToast();
      Get.back();
    } else {
      var _request = await ApiController.login(user);

      if(_request.ok) {

        LocalStorage.saveToken(_request.data['access']);

        if(_request.data['access'] != null) {


          /// ***************************************************** ///

          // final _controller = Get.put(SessionController());
          //
          // var _request0 = await ApiController.acts();
          //
          // List healthActs = [];
          // List townHallActs = [];
          //
          // if(_request0.ok) {
          //
          //   if(_request0.data['error'] == false) {
          //
          //     LocalStorage.saveAllActs(_request0.data['data']);
          //
          //     for(var act in _request0.data['data']) {
          //
          //       if(act['domaine_id'] == 0) {
          //         healthActs.add(act);
          //       }
          //
          //       if(act['domaine_id'] == 1) {
          //         townHallActs.add(act);
          //       }
          //
          //     }
          //
          //     LocalStorage.saveHealthActs(healthActs);
          //     LocalStorage.saveTownHallActs(townHallActs);
          //
          //     _controller.firstLaunch(false);
          //     Get.offAll(()=> const HomeScreen());
          //
          //
          //     log('AllActs -------------------------------------------------------->');
          //     log(LocalStorage.getAllActs().toString());
          //     log('healthActs ----------------------------------------------------->');
          //     log(LocalStorage.getHealthActs().toString());
          //     log('townHallActs --------------------------------------------------->');
          //     log(LocalStorage.getTownHallActs().toString());
          //
          //
          //   }
          //
          // } else {
          //   warningToast("Une erreur est survenue. Veuillez rééssayez.");
          //   Get.back();
          // }


          /// ***************************************************** ///

          Get.to(()=> LoadData());
          // Get.offAll(()=> HomeScreen());

        } else {
          warningToast("Une erreur est survenue. Veuillez rééssayez.");
          Get.back();
        }

      } else {
        warningToast("Une erreur est survenue. Veuillez rééssayez.");
        Get.back();
      }

    }

  }


  static Future<void> getActs() async {

    List healthActs = [];
    List townHallActs = [];

    bool hasInternetConnection = await InternetConnectionChecker().hasConnection;

    if (hasInternetConnection) {

      var _request = await ApiController.acts();

      if(_request.ok) {

        if(_request.data['error'] == false) {

          LocalStorage.saveAllActs(_request.data['data']);

          for(var act in _request.data['data']) {

            if(act['domaine_id'] == 0) {
              healthActs.add(act);
            }

            if(act['domaine_id'] == 1) {
              townHallActs.add(act);
            }


          }

          LocalStorage.saveHealthActs(healthActs);
          LocalStorage.saveTownHallActs(townHallActs);


          // log('AllActs -------------------------------------------------------->');
          // log(LocalStorage.getAllActs().toString());
          // log('healthActs ----------------------------------------------------->');
          // log(LocalStorage.getHealthActs().toString());
          // log('townHallActs --------------------------------------------------->');
          // log(LocalStorage.getTownHallActs().toString());

        }

      }
    }
  }


  static Future<void> getActsAndGoToHome() async {

    bool hasInternetConnection = await InternetConnectionChecker().hasConnection;

    if (!hasInternetConnection) {
      noConnexionToast();
      Get.back();
    } else {

      final _controller = Get.put(SessionController());

      var _request = await ApiController.acts();

      List healthActs = [];
      List townHallActs = [];

      if(_request.ok) {

        if(_request.data['error'] == false) {

          for(var act in _request.data['data']) {

            if(act['domaine_id'] == 0) {
              healthActs.add(act);
            }

            if(act['domaine_id'] == 1) {
              townHallActs.add(act);
            }

          }

          LocalStorage.saveAllActs(_request.data['data']);

          LocalStorage.saveHealthActs(healthActs);
          LocalStorage.saveTownHallActs(townHallActs);


          // log('AllActs -------------------------------------------------------->');
          // log(LocalStorage.getAllActs().toString());
          // log('healthActs ----------------------------------------------------->');
          // log(LocalStorage.getHealthActs().toString());
          // log('townHallActs --------------------------------------------------->');
          // log(LocalStorage.getTownHallActs().toString());

          _controller.firstLaunch(false);
          Get.offAll(()=> const HomeScreen());

        }

      } else {
        warningToast("Quelque chose s'est mal passé !");
        Get.back();
      }

    }
  }


  static Future<void> getConcerns() async {

    bool hasInternetConnection = await InternetConnectionChecker().hasConnection;

    if (!hasInternetConnection) {
      Get.off(()=> CommentsList(comments: LocalStorage.getAllConcerns() ?? []));
    } else {
      var _request = await ApiController.concerns();

      if(_request.ok) {

        if(_request.data['error'] == false) {

          LocalStorage.saveAllConcerns(_request.data['data']);

          log('*****************************************************');
          log(_request.data.toString());
          log('*****************************************************');

          Get.off(()=> CommentsList(comments: LocalStorage.getAllConcerns() ?? []));

        } else {
          Get.off(()=> CommentsList(comments: LocalStorage.getAllConcerns() ?? []));
        }

      } else {
        Get.off(()=> CommentsList(comments: LocalStorage.getAllConcerns() ?? []));
      }

    }
  }


  static Future<void> submitConcern(CommentModel model) async {

    bool hasInternetConnection = await InternetConnectionChecker().hasConnection;

    if (!hasInternetConnection) {
      noConnexionToast();
      Get.back();
    } else {
      var _request = await ApiController.submitConcern(model);

      if(_request.ok) {

        if(_request.data['error'] == false) {

          successToast("Préoccupation soumise avec succès !");

          Get.offAll(()=> HomeScreen());

        }
        else {
          warningToast("Quelque chose s'est mal passé !");
          Get.back();
        }

      } else {
        warningToast("Quelque chose s'est mal passé !");
        Get.back();
      }

    }

  }

}