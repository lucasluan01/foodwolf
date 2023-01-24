import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodwolf/config/theme/app_colors.dart';
import 'package:foodwolf/stores/redefine_password_store.dart';

class RedefinePasswordScreen extends StatefulWidget {
  const RedefinePasswordScreen({super.key});

  @override
  State<RedefinePasswordScreen> createState() => _RedefinePasswordScreenState();
}

class _RedefinePasswordScreenState extends State<RedefinePasswordScreen> {
  final redefineStore = RedefinePasswordStore();

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
                  errorText: redefineStore.emailError,
                  suffixIcon: redefineStore.emailError != null
                      ? Icon(
                          Icons.error,
                          color: Theme.of(context).errorColor,
                        )
                      : null,
                ),
                onChanged: redefineStore.setEmail,
              );
            }),
            const SizedBox(height: 48),
            Observer(builder: (_) {
              return ElevatedButton(
                onPressed:
                    redefineStore.timeLeft != 30 && redefineStore.timeLeft != 0 ? null : redefineStore.sendEmailPressed,
                child: const Text("Enviar e-mail"),
              );
            }),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              if (redefineStore.timeLeft == 30 || redefineStore.timeLeft == 0) {
                return Container();
              }
              return Center(
                child: Text.rich(
                  TextSpan(
                    text: "Reenviar em ",
                    children: <InlineSpan>[
                      TextSpan(
                        text: "00:${redefineStore.timeLeft.toString().padLeft(2, '0')}",
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
                if (redefineStore.message != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: redefineStore.error ? Theme.of(context).errorColor : AppColors.success,
                      content: Text(redefineStore.message!),
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
