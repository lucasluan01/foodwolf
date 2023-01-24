import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodwolf/auth/auth_service.dart';
import 'package:foodwolf/config/theme/app_colors.dart';
import 'package:foodwolf/screens/home_screen.dart';
import 'package:foodwolf/screens/redefine_password_screen.dart';
import 'package:foodwolf/screens/register_screen.dart';
import 'package:foodwolf/screens/unverified_email_screen.dart';
import 'package:foodwolf/stores/login_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginStore = LoginStore();
  AuthService auth = AuthService();

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
                  errorText: _loginStore.emailError,
                  suffixIcon: _loginStore.emailError != null
                      ? Icon(
                          Icons.error,
                          color: Theme.of(context).errorColor,
                        )
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: _loginStore.setEmail,
              );
            }),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: const OutlineInputBorder(),
                  suffixIcon: _loginStore.passwordError != null
                      ? Icon(
                          Icons.error,
                          color: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          onPressed: _loginStore.setShowPassword,
                          icon: Icon(
                            _loginStore.isShowPassword ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.neutral_1,
                          ),
                        ),
                  errorText: _loginStore.passwordError,
                ),
                obscureText: !_loginStore.isShowPassword,
                onChanged: _loginStore.setPassword,
              );
            }),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RedefinePasswordScreen(),
                  ),
                );
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
                _loginStore.loginPressed().then((_) {
                  if (auth.getCurrentUser() != null && _loginStore.formValid) {
                    if (AuthService().getCurrentUser()?.emailVerified ?? false) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UnverifiedEmailScreen()));
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
                _loginStore.googlePressed().then((_) => {
                      if (auth.getCurrentUser() != null)
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
                    });
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
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_) {
                if (_loginStore.errorMessage != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).errorColor,
                      content: Text(_loginStore.errorMessage!),
                      action: SnackBarAction(
                        label: 'Fechar',
                        textColor: Colors.white,
                        onPressed: () {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        },
                      ),
                    ));
                  });
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
