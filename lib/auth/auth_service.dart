import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService _instance = AuthService.internal();
  factory AuthService() => _instance;
  AuthService.internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
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

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return Future.error("E-mail e/ou senha inválidos");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> signInwithGoogle() async {
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error("Nenhum usuário encontrado");
      }
      // ignore: avoid_print
      print(e);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'too-many-requests') {
        return Future.error("Não foi possível atender a solicitação no momento. Tente novamente mais tarde.");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  User? getCurrentUser() {
    inspect(_auth.currentUser);
    return _auth.currentUser;
  }

  bool getIsEmailVerified() {
    return _auth.currentUser?.emailVerified ?? false;
  }
}
