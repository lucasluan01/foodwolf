import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodwolf/components/snackbar_custom.dart';
import 'package:foodwolf/enum/notification_enum.dart';
import 'package:foodwolf/stores/auth_store.dart';

class RedefinePasswordScreen extends StatefulWidget {
  const RedefinePasswordScreen({super.key});

  @override
  State<RedefinePasswordScreen> createState() => _RedefinePasswordScreenState();
}

class _RedefinePasswordScreenState extends State<RedefinePasswordScreen> {
  final authStore = AuthStore();

  @override
  void dispose() {
    super.dispose();
    authStore.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Redefinir senha")),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            const Text(
              "Informe um e-mail para redefinir sua senha",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
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
            const SizedBox(height: 48),
            Observer(builder: (_) {
              return ElevatedButton(
                onPressed: authStore.timeLeft != 30 && authStore.timeLeft != 0
                    ? null
                    : authStore.sendEmailPressed,
                child: const Text("Enviar e-mail"),
              );
            }),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              if (authStore.timeLeft == 30 || authStore.timeLeft == 0) {
                return Container();
              }
              return Center(
                child: Text.rich(
                  TextSpan(
                    text: "Reenviar em ",
                    children: <InlineSpan>[
                      TextSpan(
                        text:
                            "00:${authStore.timeLeft.toString().padLeft(2, '0')}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            Observer(
              builder: (_) {
                if (authStore.message != null) {
                  SnackBarCustom().showSnackbar(context: context, message: authStore.message!, typeNotification: authStore.isError ? InformationEnum.error : InformationEnum.success);
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
