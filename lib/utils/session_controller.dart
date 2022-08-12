import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/utils/themes.dart';

final box = GetStorage();


class SessionController extends GetxController {

  bool get isDark => box.read('darkmode') ?? false;
  ThemeData get theme => isDark ? Themes().dartTheme : Themes().lightTheme;
  void changeTheme(bool val) => box.write('darkmode', val);

  bool get isFirstTime => box.read('firstTime') ?? true;
  void firstLaunch(bool val) => box.write('firstTime', val);

}