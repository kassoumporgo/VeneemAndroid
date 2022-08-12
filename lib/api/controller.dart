import 'http_config.dart';



class ApiController {

  static Future<RequestResult> login(user) async {
    var result = await http_post("gettoken/", {
      'username': user.username,
      'password': user.password,
    });
    return result;
  }


  static Future<RequestResult> acts() async {
    var result = await http_get("acte/");
    return result;
  }

  static Future<RequestResult> concerns() async {
    var result = await http_get("preoccupation/");
    return result;
  }


  static Future<RequestResult> submitConcern(concern) async {
    var result = await http_post("preoccupation/", {
      'nom_et_prenoms': concern.nom_et_prenoms,
      'telephone': concern.telephone,
      'email': concern.email,
      'lieu': concern.lieu,
      'titre': concern.titre,
      'commentaire': concern.commentaire,
      'actes_concernes': concern.actes_concernes,
      'types_preoccupations': concern.types_preoccupations,
    });
    return result;
  }

}