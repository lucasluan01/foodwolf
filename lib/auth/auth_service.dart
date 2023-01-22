import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return Future.error("E-mail inválido");
      } else if (e.code == 'email-already-in-use') {
        return Future.error("Já existe uma conta com este e-mail");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
