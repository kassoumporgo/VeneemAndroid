import 'package:get_storage/get_storage.dart';

class LocalStorage {

  static saveToken(data) {return GetStorage().write("token", data);}
  static getToken() {return GetStorage().read("token");}

  static saveAllActs(data) {return GetStorage().write("allActs", data);}
  static getAllActs() {return GetStorage().read("allActs");}

  static saveHealthActs(data) {return GetStorage().write("healthActs", data);}
  static getHealthActs() {return GetStorage().read("healthActs");}

  static saveTownHallActs(data) {return GetStorage().write("townHallActs", data);}
  static getTownHallActs() {return GetStorage().read("townHallActs");}

  static saveAllConcerns(data) {return GetStorage().write("concerns", data);}
  static getAllConcerns() {return GetStorage().read("concerns");}

}
