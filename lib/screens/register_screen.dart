import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodwolf/components/appbar_custom.dart';

import '../stores/register_store.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerStore = RegisterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Criar conta"),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Wrap(
              runSpacing: 16,
              children: [
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.nameError,
                      suffixIcon: registerStore.nameError != null
                          ? const Icon(
                              Icons.error,
                              color: Colors.red,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setName,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "CPF (opcional)",
                      hintText: "000.000.000-00",
                      errorText: registerStore.documentError,
                      suffixIcon: registerStore.documentError != null
                          ? const Icon(
                              Icons.error,
                              color: Colors.red,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setDocument,
                    keyboardType: TextInputType.number,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "Celular",
                      hintText: "(31) 9 0000-0000",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.phoneError,
                      suffixIcon: registerStore.phoneError != null
                          ? const Icon(
                              Icons.error,
                              color: Colors.red,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setPhone,
                    keyboardType: TextInputType.number,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: "nome@exemplo.com",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.emailError,
                      suffixIcon: registerStore.emailError != null
                          ? const Icon(
                              Icons.error,
                              color: Colors.red,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setEmail,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.passwordError,
                      suffixIcon: registerStore.passwordError != null
                          ? const Icon(
                              Icons.error,
                              color: Colors.red,
                            )
                          : IconButton(
                              onPressed: registerStore.setIsShowPassword,
                              icon: Icon(
                                registerStore.isShowPassword ? Icons.visibility_off : Icons.visibility,
                                color: const Color(0xffACACAC),
                              ),
                            ),
                    ),
                    onChanged: registerStore.setPassword,
                    obscureText: !registerStore.isShowPassword,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirmar senha",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.confirmPasswordError,
                      suffixIcon: registerStore.confirmPasswordError != null
                          ? const Icon(
                              Icons.error,
                              color: Colors.red,
                            )
                          : null,
                    ),
                    obscureText: true,
                    onChanged: registerStore.setConfirmPassword,
                  );
                }),
                Observer(builder: (_) {
                  return CheckboxListTile(
                    activeColor: const Color(0xff881E09),
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    title: RichText(
                      text: TextSpan(
                        text: "Eu concordo com os ",
                        style: const TextStyle(
                          color: Color(0xff334155),
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: 'Termos & Condições',
                            style: const TextStyle(
                              color: Color(0xff881E09),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Click no termos e condicoes");
                              },
                          ),
                          const TextSpan(text: " e com a "),
                          TextSpan(
                            text: "Política de Privacidade",
                            style: const TextStyle(
                              color: Color(0xff881E09),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("politica de privacidade");
                              },
                          ),
                        ],
                      ),
                    ),
                    value: registerStore.checkTermsAndPolicy,
                    onChanged: registerStore.setCheckTermsAndPolicy,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }),
              ],
            ),
            const SizedBox(height: 48),
            Observer(builder: (_) {
              return ElevatedButton(
                onPressed: () {},
                child: const Text("Criar conta"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
