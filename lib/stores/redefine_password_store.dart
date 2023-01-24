import 'dart:async';

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
  int timeLeft = 30;

  @observable
  String? message;

  @observable
  bool error = false;

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
        timer();
        await AuthService().sendPasswordResetEmail(email: email);
        message = "E-mail enviado";
      } catch (e) {
        message = e.toString();
        error = true;
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
}
