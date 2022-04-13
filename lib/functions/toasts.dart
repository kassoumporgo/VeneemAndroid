import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';



void successToast(String text) {
  return toast(
    text,
    bgColor: Colors.green,
    length: Toast.LENGTH_LONG,
  );
}


void warningToast(String text) {
  return toast(
    text,
    bgColor: Colors.red,
    length: Toast.LENGTH_LONG,
  );
}

void noConnexionToast() {
  return warningToast("Conexion internet introuvable !");
}