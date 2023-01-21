import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:foodwolf/components/appbar_custom.dart';
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
      appBar: const AppBarCustom(title: "Redefinir senha"),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            const Text(
              "Informe um e-mail para redefinir sua senha",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff334155),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Observer(builder: (_) {
              return TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  border: const OutlineInputBorder(),
                  errorText: redefineStore.emailError,
                  suffixIcon: redefineStore.emailError != null ? const Icon(Icons.error, color: Colors.red) : null,
                ),
                onChanged: redefineStore.setEmail,
              );
            }),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Enviar e-mail"),
            ),
          ],
        ),
      ),
    );
  }
}
