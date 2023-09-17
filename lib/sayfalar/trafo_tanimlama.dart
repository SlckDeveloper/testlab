import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testlab/widgets/dekorasyonlarim.dart';

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
  String guc = "GüÇ";
  String cevirmeOraniPrimer = "Pri";
  String cevirmeOraniSekonder = "sek";

  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

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
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextSpan(
                    text: "$seriNo   $projeNo",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  )
                ])),
                Text(
                  "${guc}kVA   $cevirmeOraniPrimer/$cevirmeOraniSekonder   $baglantiGrubuText",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                )
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
        padding:
            const EdgeInsets.only(left: 18.0, right: 18.0, top: 10, bottom: 8),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                        decoration: Dekorasyonlarim()
                            .textFormFieldTrafoBilgiDecoration(),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                        decoration: Dekorasyonlarim()
                            .textFormFieldTrafoBilgiDecoration(),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                        decoration: Dekorasyonlarim()
                            .textFormFieldTrafoBilgiDecoration(),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                        decoration: Dekorasyonlarim()
                            .textFormFieldTrafoBilgiDecoration(),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  cevirmeOraniPrimer = value;
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
                              decoration: Dekorasyonlarim()
                                  .textFormFieldTrafoBilgiDecoration(),
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
                                  cevirmeOraniSekonder = value;
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
                              decoration: Dekorasyonlarim()
                                  .textFormFieldTrafoBilgiDecoration(),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                              onChanged: (value){
                                setState(() {
                                  baglantiGrubuText = value;
                                });
                              },
                              validator: (String? value) {
                                if (value == null ||
                                    value.isEmpty && baglantiGrubu == "Diger") {
                                  return 'Bağlantı grubunu giriniz!';
                                }
                                return null;
                              },
                              decoration: Dekorasyonlarim()
                                  .textFormFieldTrafoBilgiBaglantiGrubu(),
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
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_globalFormKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        'ONAYLA',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
}

///(1)
//Burada bağlantiGrubu değişkenine value değeri ataması yapıldığı için ve value
//değeri null değer alabileceği için (çünkü DropDownButton kullandık),onChenge:
//özelliği içerisinde null gelme olasılığına karşı eğer null ise baglantiGrubu ??= "BağlantıGrubu";
//yazarak değerin null olmasının önüne geçiyoruz.
