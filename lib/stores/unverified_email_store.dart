import 'package:foodwolf/auth/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'unverified_email_store.g.dart';

class UnverifiedEmailStore = _UnverifiedEmailStoreBase with _$UnverifiedEmailStore;

abstract class _UnverifiedEmailStoreBase with Store {
  @observable
  String? message;

  bool error = false;

  @action
  Future<void> pressedResendEmail() async {
    try {
      await AuthService().sendEmailVerification();
      message = "Novo e-mail enviado";
      error = false;
      AuthService().signOut();
    } catch (e) {
      message = e.toString();
      error = true;
    }
  }
}
