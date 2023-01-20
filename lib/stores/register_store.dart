import 'package:foodwolf/utils/extensions.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  String? name;

  @observable
  String? phone;

  @observable
  String? document;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  bool isShowPassword = false;

  @observable
  bool checkTermsAndPolicy = false;

  @action
  void setName(String value) => name = value.trim();

  @action
  void setPhone(String value) => phone = value.trim();

  @action
  void setDocument(String value) => document = value.trim();

  @action
  void setEmail(String value) => email = value.trim();

  @action
  void setPassword(String value) => password = value.trim();

  @action
  void setConfirmPassword(String value) => confirmPassword = value.trim();

  @action
  void setIsShowPassword() => isShowPassword = !isShowPassword;

  @action
  void setCheckTermsAndPolicy(bool? value) => checkTermsAndPolicy = value ?? false;

  @computed
  bool get nameValid => name != null && nameError == null;

  @computed
  bool get phoneValid => phone != null && phoneError == null;

  @computed
  bool get documentValid => documentError == null;

  @computed
  bool get emailValid => email != null && emailError == null;

  @computed
  bool get passwordValid => password != null && passwordError == null;

  @computed
  bool get confirmPasswordValid => confirmPassword != null && confirmPasswordError == null;

  @computed
  String? get nameError {
    if (name == null) {
      return null;
    }

    if (name!.isEmpty) {
      return "Campo obrigatório";
    }

    if (name!.length < 3) {
      return "O nome deve conter pelo menos 3 caracteres";
    }
    return null;
  }

  @computed
  String? get documentError {
    if (document == null || document!.isEmpty) {
      return null;
    }

    if (document!.length != 11) {
      return "CPF inválido";
    }
    return null;
  }

  @computed
  String? get phoneError {
    if (phone == null) {
      return null;
    }

    if (phone!.isEmpty) {
      return "Campo obrigatório";
    }

    if (phone!.length != 11) {
      return "Telefone inválido";
    }
    return null;
  }

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

    if (password!.length < 8) {
      return "A senha deve conter pelo menos 8 caracteres";
    }
    return null;
  }

  @computed
  String? get confirmPasswordError {
    if (confirmPassword == null) {
      return null;
    }

    if (confirmPassword!.isEmpty) {
      return "Campo obrigatório";
    }

    if (confirmPassword != password) {
      return "As senhas não coincidem";
    }
    return null;
  }

  @computed
  bool get isFormValid =>
      nameValid &&
      documentValid &&
      phoneValid &&
      emailValid &&
      passwordValid &&
      confirmPasswordValid &&
      checkTermsAndPolicy;
}
