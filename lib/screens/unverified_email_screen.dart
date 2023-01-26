import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodwolf/config/theme/app_colors.dart';
import 'package:foodwolf/screens/login_screen.dart';
import 'package:foodwolf/stores/unverified_email_store.dart';

class UnverifiedEmailScreen extends StatefulWidget {
  const UnverifiedEmailScreen({super.key});

  @override
  State<UnverifiedEmailScreen> createState() => _UnverifiedEmailScreenState();
}

class _UnverifiedEmailScreenState extends State<UnverifiedEmailScreen> {
  var unverifiedEmailStore = UnverifiedEmailStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Spacer(),
              Image.asset(
                "assets/icons/send_message.png",
                height: 100,
              ),
              const SizedBox(height: 24),
              Text(
                "E-mail de verificação enviado!",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                "Enviamos um e-mail para fazer a verificação do seu usuário. Se não encontrar na sua caixa de entrada, procure também na sua caixa de Spam.",
                textAlign: TextAlign.justify,
              ),
              const Spacer(),
              Observer(builder: (_) {
                return Visibility(
                  visible: !unverifiedEmailStore.wasResent,
                  child: ElevatedButton(
                    onPressed: unverifiedEmailStore.pressedResendEmail,
                    child: const Text("Reenviar e-mail"),
                  ),
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (_) {
                return OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  child: const Text("Voltar"),
                );
              }),
              Observer(
                builder: (_) {
                  if (unverifiedEmailStore.message != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: unverifiedEmailStore.error ? Theme.of(context).errorColor : AppColors.success,
                        content: Text(unverifiedEmailStore.message!),
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
      ),
    );
  }
}
