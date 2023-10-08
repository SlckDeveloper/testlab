import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<void> trafoBilgileriniKaydet({marka, seriNo, projeNo, guc, primerV, sekonderV, baglantiGrubu}) async{
    CollectionReference trafo = FirebaseFirestore.instance.collection('trafo');
    trafo.add({
      "marka" : marka,
      "seriNo":seriNo,
      "projeNo":projeNo,
      "guc": guc,
      "primerV":primerV,
      "sekonderV":sekonderV,
      "bağlantıGrubu":baglantiGrubu
    }).then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}