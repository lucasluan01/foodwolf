import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            ElevatedButton(
              onPressed: redefineStore.sendEmailPressed,
              child: const Text("Enviar e-mail"),
            ),
            Observer(
              builder: (_) {
                if (redefineStore.errorMessage != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).errorColor,
                      content: Text(redefineStore.errorMessage!),
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
