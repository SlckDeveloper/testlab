import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<String?> signInWithEmailAndPAssword(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return "giriş";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "Kullanıcı bulunamadı!";
      } else if (e.code == 'wrong-password') {
        return "Şifre hatalı!";
      }
    }
  }
}
