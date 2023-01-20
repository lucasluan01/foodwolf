import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodwolf/screens/register_screen.dart';
import 'package:foodwolf/stores/login_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginStore = LoginStore();

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
                  errorText: loginStore.emailError,
                  suffixIcon: loginStore.emailError != null
                      ? const Icon(
                          Icons.error,
                          color: Colors.red,
                        )
                      : null,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: loginStore.setEmail,
              );
            }),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: const OutlineInputBorder(),
                  suffixIcon: loginStore.passwordError != null
                      ? const Icon(
                          Icons.error,
                          color: Colors.red,
                        )
                      : IconButton(
                          onPressed: loginStore.setShowPassword,
                          icon: Icon(
                            loginStore.isShowPassword ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xffACACAC),
                          ),
                        ),
                  errorText: loginStore.passwordError,
                ),
                obscureText: loginStore.isShowPassword,
                onChanged: loginStore.setPassword,
              );
            }),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Esqueci minha senha",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff881E09),
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Entrar"),
            ),
            const SizedBox(height: 24),
            Row(
              children: const <Widget>[
                Expanded(
                  child: Divider(
                    color: Color(0xffACACAC),
                    thickness: 0.75,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "OU",
                    style: TextStyle(
                      color: Color(0xff334155),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xffACACAC),
                    thickness: 0.75,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {},
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
              child: RichText(
                text: TextSpan(
                  text: 'Não tem uma conta? ',
                  style: const TextStyle(
                    color: Color(0xff334155),
                    fontSize: 16,
                  ),
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        ),
                        child: const Text(
                          'Registre-se',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Color(0xff881E09),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
