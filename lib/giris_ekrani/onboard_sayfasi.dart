import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testlab/giris_ekrani/login_sayfasi.dart';
import 'package:testlab/sayfalar/trafo_tanimlama.dart';

class OnboardSayfasi extends StatefulWidget {
  const OnboardSayfasi({Key? key}) : super(key: key);

  @override
  State<OnboardSayfasi> createState() => _OnboardSayfasiState();
}

class _OnboardSayfasiState extends State<OnboardSayfasi> {
  bool? _girisYapilmisMi;

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        _girisYapilmisMi = false;
        print('User is currently signed out!');
      } else {
        _girisYapilmisMi = true;
        print('User is signed in!');
      }
      setState(() {
        _girisYapilmisMi;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return _girisYapilmisMi == null ? const CircularProgressIndicator() : _girisYapilmisMi == false ? const LoginSayfasi() : const TrafoTanimlama();
  }
}
