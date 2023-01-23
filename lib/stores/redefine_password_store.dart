import 'package:foodwolf/auth/auth_service.dart';
import 'package:foodwolf/utils/extensions.dart';
import 'package:mobx/mobx.dart';

part 'redefine_password_store.g.dart';

// ignore: library_private_types_in_public_api
class RedefinePasswordStore = _RedefinePasswordStoreBase with _$RedefinePasswordStore;

abstract class _RedefinePasswordStoreBase with Store {
  @observable
  String email = "";

  @observable
  bool showErrors = false;

  @observable
  String? errorMessage;

  @computed
  bool get emailValid => email.isNotEmpty && email.isEmailValid();

  @action
  void setEmail(String value) => email = value.trim();

  @computed
  String? get emailError {
    if (!showErrors || emailValid) {
      return null;
    }

    if (email.isEmpty) {
      return "Campo obrigatório";
    }

    if (!email.isEmailValid()) {
      return "E-mail inválido";
    }
    return null;
  }

  @action
  Future<void> sendEmailPressed() async {
    if (emailValid) {
      try {
        await AuthService().sendPasswordResetEmail(email: email);
      } catch (e) {
        errorMessage = e.toString();
      }
      return;
    }
    showErrors = true;
  }
}
