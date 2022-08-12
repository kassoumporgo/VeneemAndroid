import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../utils/local_storage.dart';


var token = LocalStorage.getToken();

const authorization = "Bearer ";
const _baseUrl = "https://yeeli.herokuapp.com/api/";
const contentType = "application/json; charset=utf-8";


class RequestResult {
  bool ok;
  dynamic data;

  RequestResult(this.ok, this.data);
}

Future<RequestResult> http_get(String route, [dynamic data]) async {

  final header = token != null ? {
    "Content-Type": contentType,
    "Authorization": authorization+token,
  } : {
    "Content-Type": contentType,
  };

  var dataStr = jsonEncode(data);
  var url = _baseUrl+"$route?data=$dataStr";

  var result = await http.get(Uri.parse(url), headers: header);
  try{
    return RequestResult(true, jsonDecode(utf8.decode(result.bodyBytes)));
  }catch(exception){
    log(result.body);
    return RequestResult(false, null);
  }
}

Future<RequestResult> http_post(String route, [dynamic data]) async {

  final header = token != null ? {
    "Content-Type": contentType,
    "Authorization": authorization+token,
  } : {
    "Content-Type": contentType,
  };

  var dataStr = jsonEncode(data);
  var url = _baseUrl+"$route?data=$dataStr";
  // var result = await http.post(Uri.parse(url), body: dataStr, headers: header);
  var result = await http.post(Uri.parse(url), body: dataStr, headers: header);
  // var result = await http.post(Uri.parse(_baseUrl), body: dataStr, headers: header);
  try{
    // return RequestResult(true, jsonDecode(result.body));
    return RequestResult(true, jsonDecode(utf8.decode(result.bodyBytes)));
  } catch(exception) {
    log(result.body);
    return RequestResult(false, null);
  }
}

Future<RequestResult> http_put(String route, [dynamic data]) async {

  final header = token != null ? {
    "content-type": contentType,
    "Authorization": authorization+token,
  } : {
    "content-type": contentType,
  };

  var url = _baseUrl+route;

  var dataStr = jsonEncode(data);

  log(dataStr);

  // var result = await http.put(Uri.parse(url), body: dataStr, headers: header);
  var result = await http.put(Uri.parse(_baseUrl), body: dataStr, headers: header);

  try{
    log(result.body);
    return RequestResult(true, jsonDecode(utf8.decode(result.bodyBytes)));
    // return RequestResult(true, jsonDecode(result.body));
  }catch(exception){
    log(result.body);
    return RequestResult(false, null);
  }
}



Future<RequestResult> http_delete(String route, [dynamic data]) async {

  final header = token != null ? {
    "content-type": contentType,
    "Authorization": authorization+token,
  } : {
    "content-type": contentType,
  };

  var dataStr = jsonEncode(data);
  // var url = _baseUrl+"$route?data=$dataStr";
  // var result = await http.delete(Uri.parse(url), headers: header);
  var result = await http.delete(Uri.parse(_baseUrl), headers: header);
  try{
    return RequestResult(true, jsonDecode(utf8.decode(result.bodyBytes)));
    // return RequestResult(true, jsonDecode(result.body));
  }catch(exception){
    log(result.body);
    return RequestResult(false, null);
  }
}
