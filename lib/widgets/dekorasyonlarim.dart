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
            formOnayi == true ? const Icon(Icons.dangerous_outlined, color:   Colors.redAccent,size: 29,) : const Icon(Icons.check,color:  Colors.blueGrey,size: 29,),
            const SizedBox(width: 10,),
            Text(
              "Giriş",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: formOnayi == true ? Colors.redAccent : Colors.white,),
            )
          ],
        ),
        padding: const EdgeInsets.all(4),
        backgroundColor: Colors.black);

  }
}