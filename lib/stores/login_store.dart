import 'package:foodwolf/utils/extensions.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool isShowPassword = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setShowPassword() => isShowPassword = !isShowPassword;

  @computed
  String? get emailError {
    if (email == null) {
      return null;
    }

    if (email!.isEmpty) {
      return "Campo obrigatório";
    }

    if (!email!.isEmailValid()) {
      return "E-mail inválido";
    }
    return null;
  }

  @computed
  String? get passwordError {
    if (password == null) {
      return null;
    }

    if (password!.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }
}
