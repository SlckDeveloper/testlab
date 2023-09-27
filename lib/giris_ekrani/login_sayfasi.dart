import 'package:flutter/material.dart';
import 'package:testlab/fonksiyonlar/form_fonksiyonlarim.dart';
import 'package:testlab/sayfalar/trafo_tanimlama.dart';
import 'package:testlab/servisler/auth.dart';
import 'package:testlab/widgets/dekorasyonlarim.dart';

class LoginSayfasi extends StatefulWidget {
  const LoginSayfasi({Key? key}) : super(key: key);

  @override
  State<LoginSayfasi> createState() => _LoginSayfasiState();
}

class _LoginSayfasiState extends State<LoginSayfasi> {
  /*String? isim, email;*/
  String _textSifre = "", _textEmail = "";
  final formKey = GlobalKey<FormState>();
  bool formOnayliMi = false;

  @override
  void dispose() {
    formOnayliMi;
    formKey;
    _textSifre;
    _textEmail;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                decoration: Dekorasyonlarim().textFormFieldEmailDecoration(),
                validator: (value) {
                  if ((value != null && !value.contains('@')) ||
                      (value != null && !value.contains('.com')))
                    return "Geçerli bir eposta adresi giriniz!";
                  return null;
                },
                onSaved: (data) => _textEmail = data!,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: Dekorasyonlarim().textFormFieldSifreDecoration(),
                validator: (value) {
                  if (value != null && value.length < 6) return "En az 6 haneli bir şifre giriniz!";
                  return null;
                },
                onSaved: (data) => _textSifre = data!,
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Dekorasyonlarim().chipWidget(
                      formOnayi: formOnayliMi,
                    ),
                    onTap: () => _saveFormData(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveFormData() async{
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      formOnayliMi = true;
      String? giris = await Auth().signInWithEmailAndPAssword(_textEmail, _textSifre);
      if(giris == "giriş"){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TrafoTanimlama(),
          ),
        );
      }else{
        print("wrrrrrrrrrrrrrrrrrrrrrrrrrrroooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooonnnnnnnnnnnnnnnnnnnnnngggg!!!!!!!!!!");
      }

    } else {
      formOnayliMi = false;
    }
    setState(() {
      formOnayliMi;
      _textEmail;
    });
  }
}
