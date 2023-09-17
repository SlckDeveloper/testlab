import 'package:flutter/material.dart';
import 'package:testlab/fonksiyonlar/form_fonksiyonlarim.dart';
import 'package:testlab/widgets/dekorasyonlarim.dart';

class LoginSayfasi extends StatefulWidget {
  const LoginSayfasi({Key? key}) : super(key: key);

  @override
  State<LoginSayfasi> createState() => _LoginSayfasiState();
}

class _LoginSayfasiState extends State<LoginSayfasi> {
  /*String? isim, email;*/
  String _textIsim = "", _textEmail = "";
  final formKey = GlobalKey<FormState>();
  bool formOnayliMi = false;

  @override
  void dispose() {
    formOnayliMi;
    formKey;
    _textIsim;
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
                decoration: Dekorasyonlarim().textFormFieldIsimDecoration(),
                validator: (value) {
                  if (value != null && value.length < 3)
                    return "İsim alanı en az 3 karakter olmalıdır";
                  return null;
                },
                onSaved: (data) => _textIsim = data!,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: Dekorasyonlarim().textFormFieldEmailDecoration(),
                validator: (value) {
                  if ((value != null && !value.contains('@')) ||
                      (value != null && !value.contains('.com')))
                    return "Geçerli bir eposta adresi giriniz";
                  return null;
                },
                onSaved: (data) => _textEmail = data!,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                decoration: Dekorasyonlarim().textFormFieldSifreDecoration(),
              ),
              SizedBox(
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

  void _saveFormData() {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      formOnayliMi = true;
    } else {
      formOnayliMi = false;
    }
    setState(() {
      formOnayliMi;
      _textIsim;
      _textEmail;
    });
  }
}
