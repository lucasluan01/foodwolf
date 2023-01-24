import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodwolf/auth/auth_service.dart';
import 'package:foodwolf/models/user_model.dart';
import 'package:foodwolf/repositories/user_repository.dart';
import 'package:foodwolf/utils/extensions.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

// ignore: library_private_types_in_public_api
class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  @observable
  String name = "";

  @observable
  String phone = "";

  @observable
  String? document;

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String confirmPassword = "";

  @observable
  bool isShowPassword = false;

  @observable
  bool checkTermsAndPolicy = false;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  bool showErrors = false;

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
  bool get nameValid => name.length >= 3;

  @computed
  bool get phoneValid => phone.length == 11;

  @computed
  bool get documentValid => documentError == null || document!.length != 11;

  @computed
  bool get emailValid => email.isEmailValid();

  @computed
  bool get passwordValid => password.length >= 8;

  @computed
  bool get confirmPasswordValid => confirmPassword.length >= 8 && confirmPassword == password;

  @computed
  String? get nameError {
    if (!showErrors || nameValid) {
      return null;
    }
    if (name.isEmpty) {
      return "Campo obrigatório";
    }
    if (name.length < 3) {
      return "O nome deve conter pelo menos 3 caracteres";
    }
    return null;
  }

  @computed
  String? get documentError {
    if (!showErrors || document == null || document!.isEmpty) {
      return null;
    }
    if (document!.length != 11) {
      return "CPF inválido";
    }
    return null;
  }

  @computed
  String? get phoneError {
    if (!showErrors || phoneValid) {
      return null;
    }
    if (phone.isEmpty) {
      return "Campo obrigatório";
    }
    if (phone.length != 11) {
      return "Telefone inválido";
    }
    return null;
  }

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

  @computed
  String? get passwordError {
    if (!showErrors || passwordValid) {
      return null;
    }
    if (password.isEmpty) {
      return "Campo obrigatório";
    }
    if (password.length < 8) {
      return "A senha deve conter pelo menos 8 caracteres";
    }
    return null;
  }

  @computed
  String? get confirmPasswordError {
    if (!showErrors || confirmPasswordValid) {
      return null;
    }
    if (confirmPassword.isEmpty) {
      return "Campo obrigatório";
    }
    if (confirmPassword != password) {
      return "As senhas não coincidem";
    }
    return null;
  }

  @action
  checkTermsAndPolicyError() {
    if (!showErrors) {
      return null;
    }
    if (!checkTermsAndPolicy) {
      errorMessage = "Você precisa aceitar os Termos e a Política de Privacidade";
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

  @action
  Future<void> _createUser() async {
    isLoading = true;

    try {
      await AuthService().createUserWithEmailAndPassword(email: email, password: password);
      User user = AuthService().getCurrentUser()!;
      var newUser = UserModel(id: user.uid, name: name, document: document, phone: phone);
      await UserRepository.addUser(user: newUser);
      await AuthService().sendEmailVerification();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> registerPressed() async {
    checkTermsAndPolicyError();

    if (isFormValid) {
      _createUser();
      return;
    }
    showErrors = true;
  }
}
