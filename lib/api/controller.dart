import '../utils/http_config.dart';



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
      'username': concern.username,
      'password': concern.password,
    });
    return result;
  }

}