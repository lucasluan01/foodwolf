import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodwolf/auth/auth_service.dart';
import 'package:foodwolf/models/user_model.dart';
import 'package:foodwolf/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:foodwolf/utils/extensions.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final AuthService _authService = AuthService();

  @observable
  String name = "";

  @observable
  String phone = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String confirmPassword = "";

  @observable
  int timeLeft = 30;

  @observable
  bool isError = false;

  @observable
  bool isShowPassword = false;

  @observable
  bool showErrors = false;

  @observable
  bool isLoading = false;

  @observable
  bool checkTermsAndPolicy = false;

  @observable
  bool wasResent = false;

  @observable
  String? message;

  @observable
  String? document;

  @action
  void setEmail(String value) => email = value.trim();

  @action
  void setPassword(String value) => password = value.trim();

  @action
  void setShowPassword() => isShowPassword = !isShowPassword;

  @action
  void setName(String value) => name = value.trim();

  @action
  void setPhone(String value) => phone = value.trim();

  @action
  void setDocument(String value) => document = value.trim();

  @action
  void setConfirmPassword(String value) => confirmPassword = value.trim();

  @action
  void setIsShowPassword() => isShowPassword = !isShowPassword;

  @action
  void setCheckTermsAndPolicy(bool? value) =>
      checkTermsAndPolicy = value ?? false;

  @computed
  bool get emailValid => email.isEmailValid();

  @computed
  bool get passwordValid => password.isNotEmpty;

  @computed
  bool get formLoginValid => emailValid && passwordValid;

  @computed
  bool get formRegisterValid =>
      nameValid &&
      documentValid &&
      phoneValid &&
      emailValid &&
      passwordValid &&
      confirmPasswordValid &&
      checkTermsAndPolicy;

  @computed
  bool get nameValid => name.length >= 3;

  @computed
  bool get phoneValid => phone.length == 11;

  @computed
  bool get documentValid => documentError == null || document!.length != 11;

  @computed
  bool get confirmPasswordValid =>
      confirmPassword.length >= 8 && confirmPassword == password;

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
    return null;
  }

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
      message = "Você precisa aceitar os Termos e a Política de Privacidade";
    }
    return null;
  }

  @action
  Future<void> loginPressed() async {
    message = null;

    if (formLoginValid) {
      await _login();
      return;
    }
    showErrors = true;
  }

  @action
  Future<void> _login() async {
    isLoading = true;
    try {
      await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      message = null;
    } catch (e) {
      message = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> googlePressed() async {
    message = null;
    isLoading = true;
    try {
      await _authService.signInwithGoogle();
    } catch (e) {
      message = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> sendEmailPressed() async {
    message = null;
    if (emailValid) {
      try {
        await _authService.sendPasswordResetEmail(email: email);
        message = "E-mail enviado";
        isError = false;
        timer();
      } catch (e) {
        message = e.toString();
        isError = true;
      }
      return;
    }
    showErrors = true;
  }

  @action
  void timer() {
    timeLeft = 30;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
        }
      },
    );
  }

  @action
  Future<void> _createUser() async {
    isLoading = true;

    try {
      await _authService.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = _authService.getCurrentUser()!;
      var newUser =
          UserModel(id: user.uid, name: name, document: document, phone: phone);
      await UserRepository.addUser(user: newUser);
      await _authService.sendEmailVerification();
    } catch (e) {
      message = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> registerPressed() async {
    message = null;
    checkTermsAndPolicyError();

    if (formRegisterValid) {
      await _createUser();
      return;
    }
    showErrors = true;
  }

  @action
  Future<void> pressedResendEmail() async {
    message = null;

    try {
      await _authService.sendEmailVerification();
      isError = false;
      wasResent = true;
      message = "Novo e-mail enviado";
      _authService.signOut();
    } catch (e) {
      wasResent = false;
      isError = true;
      message = e.toString();
    }
  }

  @action
  void dispose() {
    name = "";
    phone = "";
    email = "";
    password = "";
    confirmPassword = "";
    timeLeft = 30;
    isError = false;
    isShowPassword = false;
    showErrors = false;
    isLoading = false;
    checkTermsAndPolicy = false;
    wasResent = false;
    message = null;
    document = null;
  }
}
