import 'package:flutter/material.dart';
import 'package:foodwolf/auth/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                AuthService().signOut();
                Navigator.pushNamed(context, '/login');
              },
              child: const Text("Desconectar-se"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text("Ir para a tela de perfil"),
            ),
          ],
        ),
      ),
    );
  }
}
