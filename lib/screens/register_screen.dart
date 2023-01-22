import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodwolf/config/theme/app_colors.dart';

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
      appBar: AppBar(title: const Text("Criar conta")),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Wrap(
              runSpacing: 16,
              children: [
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !registerStore.isLoading,
                    decoration: InputDecoration(
                      filled: registerStore.isLoading,
                      labelText: "Nome",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.nameError,
                      suffixIcon: registerStore.nameError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).errorColor,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setName,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !registerStore.isLoading,
                    decoration: InputDecoration(
                      filled: registerStore.isLoading,
                      border: const OutlineInputBorder(),
                      labelText: "CPF (opcional)",
                      hintText: "000.000.000-00",
                      errorText: registerStore.documentError,
                      suffixIcon: registerStore.documentError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).errorColor,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setDocument,
                    keyboardType: TextInputType.number,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !registerStore.isLoading,
                    decoration: InputDecoration(
                      filled: registerStore.isLoading,
                      labelText: "Celular",
                      hintText: "(31) 9 0000-0000",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.phoneError,
                      suffixIcon: registerStore.phoneError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).errorColor,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setPhone,
                    keyboardType: TextInputType.number,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !registerStore.isLoading,
                    decoration: InputDecoration(
                      filled: registerStore.isLoading,
                      labelText: "E-mail",
                      hintText: "nome@exemplo.com",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.emailError,
                      suffixIcon: registerStore.emailError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).errorColor,
                            )
                          : null,
                    ),
                    onChanged: registerStore.setEmail,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !registerStore.isLoading,
                    decoration: InputDecoration(
                      filled: registerStore.isLoading,
                      labelText: "Senha",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.passwordError,
                      suffixIcon: registerStore.passwordError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).errorColor,
                            )
                          : IconButton(
                              onPressed: registerStore.setIsShowPassword,
                              icon: Icon(
                                registerStore.isShowPassword ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.neutral_1,
                              ),
                            ),
                    ),
                    onChanged: registerStore.setPassword,
                    obscureText: !registerStore.isShowPassword,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !registerStore.isLoading,
                    decoration: InputDecoration(
                      filled: registerStore.isLoading,
                      labelText: "Confirmar senha",
                      border: const OutlineInputBorder(),
                      errorText: registerStore.confirmPasswordError,
                      suffixIcon: registerStore.confirmPasswordError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).errorColor,
                            )
                          : null,
                    ),
                    obscureText: true,
                    onChanged: registerStore.setConfirmPassword,
                  );
                }),
                Observer(builder: (_) {
                  return CheckboxListTile(
                    enabled: !registerStore.isLoading,
                    activeColor: Theme.of(context).colorScheme.primary,
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    title: Text.rich(
                      TextSpan(
                        text: "Eu concordo com os ",
                        children: [
                          TextSpan(
                            text: 'Termos & Condições',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Click no termos e condicoes");
                              },
                          ),
                          const TextSpan(text: " e com a "),
                          TextSpan(
                            text: "Política de Privacidade",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
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
                onPressed: registerStore.isLoading ? null : registerStore.loginPressed,
                child: registerStore.isLoading ? const CircularProgressIndicator() : const Text("Criar conta"),
              );
            }),
            Observer(builder: (_) {
              if (registerStore.errorMessage != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Theme.of(context).errorColor,
                    content: Text(registerStore.errorMessage!),
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
            }),
          ],
        ),
      ),
    );
  }
}
