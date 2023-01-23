import 'package:flutter/material.dart';
import 'package:foodwolf/auth/auth_service.dart';
import 'package:foodwolf/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () async {
            AuthService().signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: const Text("Desconectar-se"),
        ),
      ),
    );
  }
}
