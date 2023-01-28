import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodwolf/config/theme/app_colors.dart';
import 'package:foodwolf/stores/auth_store.dart';
import 'package:foodwolf/enum/notification_enum.dart';
import '../components/snackbar_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final authStore = AuthStore();

  @override
  void dispose() {
    super.dispose();
    authStore.dispose();
  }

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
                    enabled: !authStore.isLoading,
                    decoration: InputDecoration(
                      filled: authStore.isLoading,
                      labelText: "Nome",
                      border: const OutlineInputBorder(),
                      errorText: authStore.nameError,
                      suffixIcon: authStore.nameError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).colorScheme.error,
                            )
                          : null,
                    ),
                    onChanged: authStore.setName,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !authStore.isLoading,
                    decoration: InputDecoration(
                      filled: authStore.isLoading,
                      border: const OutlineInputBorder(),
                      labelText: "CPF (opcional)",
                      hintText: "000.000.000-00",
                      errorText: authStore.documentError,
                      suffixIcon: authStore.documentError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).colorScheme.error,
                            )
                          : null,
                    ),
                    onChanged: authStore.setDocument,
                    keyboardType: TextInputType.number,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !authStore.isLoading,
                    decoration: InputDecoration(
                      filled: authStore.isLoading,
                      labelText: "Celular",
                      hintText: "(31) 9 0000-0000",
                      border: const OutlineInputBorder(),
                      errorText: authStore.phoneError,
                      suffixIcon: authStore.phoneError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).colorScheme.error,
                            )
                          : null,
                    ),
                    onChanged: authStore.setPhone,
                    keyboardType: TextInputType.number,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !authStore.isLoading,
                    decoration: InputDecoration(
                      filled: authStore.isLoading,
                      labelText: "E-mail",
                      hintText: "nome@exemplo.com",
                      border: const OutlineInputBorder(),
                      errorText: authStore.emailError,
                      suffixIcon: authStore.emailError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).colorScheme.error,
                            )
                          : null,
                    ),
                    onChanged: authStore.setEmail,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !authStore.isLoading,
                    decoration: InputDecoration(
                      filled: authStore.isLoading,
                      labelText: "Senha",
                      border: const OutlineInputBorder(),
                      errorText: authStore.passwordError,
                      suffixIcon: authStore.passwordError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).colorScheme.error,
                            )
                          : IconButton(
                              onPressed: authStore.setIsShowPassword,
                              icon: Icon(
                                authStore.isShowPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.neutral_1,
                              ),
                            ),
                    ),
                    onChanged: authStore.setPassword,
                    obscureText: !authStore.isShowPassword,
                  );
                }),
                Observer(builder: (_) {
                  return TextFormField(
                    enabled: !authStore.isLoading,
                    decoration: InputDecoration(
                      filled: authStore.isLoading,
                      labelText: "Confirmar senha",
                      border: const OutlineInputBorder(),
                      errorText: authStore.confirmPasswordError,
                      suffixIcon: authStore.confirmPasswordError != null
                          ? Icon(
                              Icons.error,
                              color: Theme.of(context).colorScheme.error,
                            )
                          : null,
                    ),
                    obscureText: true,
                    onChanged: authStore.setConfirmPassword,
                  );
                }),
                Observer(builder: (_) {
                  return CheckboxListTile(
                    enabled: !authStore.isLoading,
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
                    value: authStore.checkTermsAndPolicy,
                    onChanged: authStore.setCheckTermsAndPolicy,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }),
              ],
            ),
            const SizedBox(height: 48),
            Observer(builder: (_) {
              return ElevatedButton(
                onPressed: authStore.isLoading
                    ? null
                    : () {
                        authStore.registerPressed().then((_) => {
                              if (authStore.formRegisterValid &&
                                  authStore.message == null)
                                {
                                  Navigator.pushNamed(
                                      context, '/unverified-email')
                                }
                            });
                      },
                child: authStore.isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Criar conta"),
              );
            }),
            Observer(builder: (_) {
              if (authStore.message != null) {
                SnackBarCustom().showSnackbar(
                    context: context,
                    message: authStore.message!,
                    typeNotification: InformationEnum.error);
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}
