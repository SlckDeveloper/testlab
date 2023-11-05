import 'package:flutter/material.dart';

class Mesajlar{
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarMesaji({required BuildContext context, required String mesaj, Color arkaplanRengi=Colors.black54}){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mesaj),backgroundColor: arkaplanRengi,));
  }
  
}