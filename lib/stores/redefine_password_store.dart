import 'package:foodwolf/utils/extensions.dart';
import 'package:mobx/mobx.dart';

part 'redefine_password_store.g.dart';

class RedefinePasswordStore = _RedefinePasswordStoreBase with _$RedefinePasswordStore;

abstract class _RedefinePasswordStoreBase with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value.trim();

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
}
