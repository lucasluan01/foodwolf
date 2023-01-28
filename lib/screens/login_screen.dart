import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodwolf/auth/auth_service.dart';
import 'package:foodwolf/components/snackbar_custom.dart';
import 'package:foodwolf/config/theme/app_colors.dart';
import 'package:foodwolf/enum/notification_enum.dart';
import 'package:foodwolf/stores/auth_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authStore = AuthStore();
  AuthService auth = AuthService();

  @override
  void dispose() {
    super.dispose();
    _authStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            SvgPicture.asset(
              "assets/logo/logo.svg",
            ),
            const SizedBox(height: 48),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  border: const OutlineInputBorder(),
                  errorText: _authStore.emailError,
                  suffixIcon: _authStore.emailError != null
                      ? Icon(
                          Icons.error,
                          color: Theme.of(context).colorScheme.error,
                        )
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: _authStore.setEmail,
              );
            }),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: const OutlineInputBorder(),
                  suffixIcon: _authStore.passwordError != null
                      ? Icon(
                          Icons.error,
                          color: Theme.of(context).colorScheme.error,
                        )
                      : IconButton(
                          onPressed: _authStore.setShowPassword,
                          icon: Icon(
                            _authStore.isShowPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.neutral_1,
                          ),
                        ),
                  errorText: _authStore.passwordError,
                ),
                obscureText: !_authStore.isShowPassword,
                onChanged: _authStore.setPassword,
              );
            }),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/redefine-password');
              },
              child: Text(
                "Esqueci minha senha",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                _authStore.loginPressed().then((_) {
                  if (auth.getCurrentUser() != null &&
                      _authStore.formLoginValid &&
                      _authStore.message == null) {
                    if (auth.getIsEmailVerified()) {
                      Navigator.pushNamed(context, '/home');
                    } else {
                      Navigator.pushNamed(context, '/unverified-email');
                    }
                  }
                });
              },
              child: const Text("Entrar"),
            ),
            const SizedBox(height: 24),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    color: AppColors.neutral_1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "OU",
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.neutral_1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: (() {
                _authStore.googlePressed().then((_) =>
                    auth.getCurrentUser() != null
                        ? Navigator.pushNamed(context, '/home')
                        : '');
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/google.svg",
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Continuar com Google",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(height: 36),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Não tem uma conta? ',
                  children: [
                    TextSpan(
                      text: 'Registre-se',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.pushNamed(context, '/register'),
                    ),
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_) {
                if (_authStore.message != null) {
                  SnackBarCustom().showSnackbar(context: context, message: _authStore.message!, typeNotification: InformationEnum.error);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
