import 'package:flutter/material.dart';

class Dekorasyonlarim {

  InputDecoration textFormFieldIsimDecoration(){
    return const InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: "İsminiz",
        hintText: "İsim",
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)));

  }

  InputDecoration textFormFieldEmailDecoration(){
    return const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: "Email",
        hintText: "mail@",
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)));
  }

  InputDecoration textFormFieldSifreDecoration(){
    return const InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: "Şifre",
        hintText: "Şifre",
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)));
  }

  InputDecoration textFormFieldTrafoBilgiDecoration() {
    return const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)));
  }

  InputDecoration textFormFieldTrafoBilgiBaglantiGrubu() {
    return const InputDecoration(
      hintText: "Diğer",
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)));
  }

  Chip chipWidget({required bool formOnayi,}){
    return Chip(
        label: Row(
          children: [
            Icon(Icons.check,color: formOnayi == true ? Colors.green : Colors.blueGrey,size: 29,),
            const SizedBox(width: 10,),
            Text(
              "Giriş",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: formOnayi == true ? Colors.green : Colors.white,),
            )
          ],
        ),
        padding: const EdgeInsets.all(4),
        backgroundColor: Colors.black);

  }
}