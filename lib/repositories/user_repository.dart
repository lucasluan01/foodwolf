import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodwolf/models/user_model.dart';

class UserRepository {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addUser({
    required UserModel user,
  }) async {
    firestore
        .collection("users")
        .doc(user.id)
        .set(user.toJson())
        .then((value) => print("Usuário adicionado"))
        .catchError((error) => print("Falha ao adicionar o usuário: $error"));
  }
}
