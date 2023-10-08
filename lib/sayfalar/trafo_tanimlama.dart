import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testlab/sayfalar/testler/ttr.dart';
import 'package:testlab/servisler/firestore_database.dart';
import 'package:testlab/widgets/dekorasyonlarim.dart';
import 'package:testlab/widgets/mesajlar.dart';

class TrafoTanimlama extends StatefulWidget {
  const TrafoTanimlama({Key? key}) : super(key: key);

  @override
  State<TrafoTanimlama> createState() => _TrafoTanimlamaState();
}

class _TrafoTanimlamaState extends State<TrafoTanimlama> {
  String? baglantiGrubu;
  String? baglantiGrubuText = "BGrubu";
  String marka = "EREN";
  String seriNo = "SeriNo";
  String projeNo = "ProjeNo";
  String guc = "Güç";
  String primerV = "PRI";
  String sekonderV = "sek";

  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  bool bilgilerVeritanainaKaydediliyor = false;
  bool veriKaydiBasariliMi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "$marka    ",
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  TextSpan(
                    text: "$seriNo   $projeNo",
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                  )
                ])),
                Text(
                  "${guc}kVA  $primerV / $sekonderV  $baglantiGrubuText ",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const CircleAvatar(
              child: Icon(Icons.person),
            )
          ],
        ),
      ),
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10, bottom: 8),
        child: SingleChildScrollView(
          child: Form(
            key: _globalFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Marka:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            marka = value;
                          });
                        },
                        textCapitalization: TextCapitalization.characters,
                        initialValue: "EREN",
                        decoration: Dekorasyonlarim().textFormFieldTrafoBilgiDecoration(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Seri Numarası:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            seriNo = value;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen bir seri numarası girin!';
                          }
                          return null;
                        },
                        decoration: Dekorasyonlarim().textFormFieldTrafoBilgiDecoration(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Proje Numarası:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            projeNo = value;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen bir proje numarası girin!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: Dekorasyonlarim().textFormFieldTrafoBilgiDecoration(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Güç (kVA):",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            guc = value;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen güç değerini girin!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: Dekorasyonlarim().textFormFieldTrafoBilgiDecoration(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        child: Text(
                      "Çevirme Oranı (kV):",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  primerV = value;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Primer gerilimini giriniz!';
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: Dekorasyonlarim().textFormFieldTrafoBilgiDecoration(),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text("/"),
                          const SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  sekonderV = value;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Sekonder gerilimini giriniz!';
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: Dekorasyonlarim().textFormFieldTrafoBilgiDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Bağlantı Grubu:",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: DropdownButtonFormField(
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Bağlantı grubunu seçiniz!';
                                }
                                return null;
                              },
                              iconEnabledColor: Colors.deepPurple,
                              iconSize: 35,
                              hint: Text(
                                "Seç",
                                style: GoogleFonts.patuaOne(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "Dyn11",
                                  child: Text("Dyn11"),
                                ),
                                DropdownMenuItem(
                                  value: "Dyn5",
                                  child: Text("Dyn5"),
                                ),
                                DropdownMenuItem(
                                  value: "Yzn11",
                                  child: Text("Yzn11"),
                                ),
                                DropdownMenuItem(
                                  value: "Yzn5",
                                  child: Text("Yzn5"),
                                ),
                                DropdownMenuItem(
                                  value: "Diger",
                                  child: Text("Diger"),
                                ),
                              ],
                              value: baglantiGrubu,
                              onChanged: (value) {
                                setState(() {
                                  //(1)
                                  baglantiGrubu = value;
                                  baglantiGrubuText = value;
                                });
                              },
                              style: GoogleFonts.patuaOne(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  baglantiGrubuText = value;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty && baglantiGrubu == "Diger") {
                                  return 'Bağlantı grubunu giriniz!';
                                }
                                return null;
                              },
                              decoration: Dekorasyonlarim().textFormFieldTrafoBilgiBaglantiGrubu(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: bilgilerVeritanainaKaydediliyor == true
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () => _kaydet(context),
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              'ONAYLA',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: bilgilerVeritanainaKaydediliyor == true
                      ? const CircularProgressIndicator()
                      :  ElevatedButton(
                          onPressed: veriKaydiBasariliMi == true ? () => _testKategoriSayfasi(context) : null,
                          child: const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text(
                              'TESTLERE BAŞLA',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _kaydet(BuildContext context) async {
    if (_globalFormKey.currentState!.validate()) {
      setState(() {
        bilgilerVeritanainaKaydediliyor = true;
      });
      await Future.delayed(const Duration(seconds: 1), () {
        // code to be executed after 2 seconds
      });
      await FirestoreDatabase()
          .trafoBilgileriniKaydet(marka: marka, seriNo: seriNo, projeNo: projeNo, guc: guc, primerV: primerV, sekonderV: sekonderV, baglantiGrubu: baglantiGrubu);
      setState(() {
        bilgilerVeritanainaKaydediliyor = false;
      });
      if (context.mounted) Mesajlar().snackBarMesaji(context: context, mesaj: "Veriler Başarıyla Kaydedildi.", color: Colors.green);
      veriKaydiBasariliMi = true;
    } else {
      if (context.mounted) Mesajlar().snackBarMesaji(context: context, mesaj: "Yeniden deneyiniz!", color: Colors.black54);
      veriKaydiBasariliMi = false;
    }
  }
}

void _testKategoriSayfasi(BuildContext context){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const TTR(),
    ),
  );
}

///(1)
//Burada bağlantiGrubu değişkenine value değeri ataması yapıldığı için ve value
//değeri null değer alabileceği için (çünkü DropDownButton kullandık),onChenge:
//özelliği içerisinde null gelme olasılığına karşı eğer null ise baglantiGrubu ??= "BağlantıGrubu";
//yazarak değerin null olmasının önüne geçiyoruz.

//TODO: veriler kaydedilirken aynı verinin daha önce var olup olmadığı kontrol edilmeli, aynı trafoya ait bir verigirişi varsa kullanıcıya uyarı ekranı gösterilerek verileri
//güncelleyip güncellememek istediğnin onayı alınmalı.
