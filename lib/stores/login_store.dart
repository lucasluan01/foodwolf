import 'package:foodwolf/auth/auth_service.dart';
import 'package:foodwolf/utils/extensions.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool isShowPassword = false;

  @observable
  bool showErrors = false;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  void setEmail(String value) => email = value.trim();

  @action
  void setPassword(String value) => password = value.trim();

  @action
  void setShowPassword() => isShowPassword = !isShowPassword;

  @computed
  bool get emailValid => email.isEmailValid();

  @computed
  bool get passwordValid => password.isNotEmpty;

  @computed
  bool get formValid => emailValid && passwordValid;

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

  @action
  Future<void> loginPressed() async {
    if (formValid) {
      await _login();
      return;
    }
    showErrors = true;
  }

  @action
  Future<void> _login() async {
    isLoading = true;
    try {
      await AuthService().signInWithEmailAndPassword(email: email, password: password);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
  }

  @action
  Future<void> googlePressed() async {
    isLoading = true;
    try {
      await AuthService().signInwithGoogle();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
  }
}
