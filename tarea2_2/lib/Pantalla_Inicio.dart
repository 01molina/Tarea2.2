import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  final String email;

  PantallaInicio({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla de Inicio"),
      ),
      body: Center(
        child: Text(
          "Bienvenido, $email",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
