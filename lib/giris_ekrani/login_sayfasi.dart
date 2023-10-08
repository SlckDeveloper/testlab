import 'package:flutter/material.dart';
import 'package:testlab/sayfalar/trafo_tanimlama.dart';
import 'package:testlab/servisler/auth.dart';
import 'package:testlab/widgets/dekorasyonlarim.dart';
import 'package:testlab/widgets/mesajlar.dart';

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
  bool bilgilerVeritanainaKaydediliyor = false;

  @override
  void dispose() {
    bilgilerVeritanainaKaydediliyor;
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
                  if ((value != null && !value.contains('@')) || (value != null && !value.contains('.com'))) {
                    return "Geçerli bir eposta adresi giriniz!";
                  }
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
                  if (value != null && value.length < 6) {
                    return "En az 6 haneli bir şifre giriniz!";
                  }
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
                    child: bilgilerVeritanainaKaydediliyor == true
                        ? const CircularProgressIndicator()
                        : Dekorasyonlarim().chipWidget(
                            formOnayi: formOnayliMi,
                          ),
                    onTap: () => _saveFormData(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveFormData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      formOnayliMi = true;
      setState(() {
        bilgilerVeritanainaKaydediliyor = true;
      });
      String? giris = await Auth().signInWithEmailAndPAssword(_textEmail, _textSifre);
      setState(() {
        bilgilerVeritanainaKaydediliyor = false;
      });
      if (giris == "giriş") {
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TrafoTanimlama(),
            ),
          );
        }
      } else {
        setState(() {
          bilgilerVeritanainaKaydediliyor = false;
        });

        if (context.mounted) Mesajlar().snackBarMesaji(context: context, mesaj: giris!);
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

/// bool bilgilerVeritanainaKaydediliyor
// Bu değişken kodların başında false değeri ile tanımlandı. Bu değişken sayesinde
//InkWell widget'ının içerisindeki butona basıldığında bir CircularProgressIndicator()
//çalışacak ve giriş yapılıyor algısı oluşacak. Eğer giriş başarısız olursa
//_saveFormData classının içerisinde yer alan değer değişiklikleri ile Giriş butonu
//tekrar görünür hale gelecektir.

/// if(context.mounted)
// Dart, async fonksiyonlar içerisinde context kullanımını önermiyor. Bunun önüne
//geçmek için context içeren widgetlardan önce if(context.mounted) yapısı ekleniyor,
//ayrıca fonksiyona da _saveFormData(BuildContext context) parametreleri atanıyor.
//Fonksiyonu çağırdığımız yerde de parametre olarak context değerini veriyoruz.

//TODO: Butona birden fazla tıklama olayı
//Giriş butonuna hızlıca arda arda basıldığında birden fazla trafo tanımlama sayfası
//üst üste açılıyor, pop yaptığımda başka bir trafo tanımlama sayfasına dönüyor.
//Fakat butona basıldığında CircularProgressIndicator() çalıştığı için hızlıca
//buton yerine 'yükleniyor ikonu' geldiğinden, butona en fazla iki veya üç defa ard arda
//basılabiliyor. Şimdilik bu problemi es geçiyorum. İleride çözülmesi gerekebilir.

//TODO: pop yapılıp tekrar bu sayfaya gelindiğinde buton yazı ve ikonu kırmızı renkte
//kalmaya devam ediyor. Bu sorunda ileride çözülmelidir.
