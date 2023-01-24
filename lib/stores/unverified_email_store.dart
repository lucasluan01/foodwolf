import 'package:foodwolf/auth/auth_service.dart';
import 'package:mobx/mobx.dart';

part 'unverified_email_store.g.dart';

// ignore: library_private_types_in_public_api
class UnverifiedEmailStore = _UnverifiedEmailStoreBase with _$UnverifiedEmailStore;

abstract class _UnverifiedEmailStoreBase with Store {
  @observable
  String? message;

  @observable
  bool error = false;

  @observable
  bool wasResent = false;

  @action
  Future<void> pressedResendEmail() async {
    try {
      await AuthService().sendEmailVerification();
      error = false;
      wasResent = true;
      message = "Novo e-mail enviado";
      AuthService().signOut();
    } catch (e) {
      wasResent = false;
      error = true;
      message = e.toString();
    }
  }
}
