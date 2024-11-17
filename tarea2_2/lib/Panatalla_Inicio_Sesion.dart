import 'package:flutter/material.dart';
import 'package:tarea2_2/Pantalla_Inicio.dart';
import 'package:tarea2_2/Pantalla_Registro.dart';

class PantallaInicioSesion extends StatefulWidget {
  @override
  _EstadoPantallaInicioSesion createState() => _EstadoPantallaInicioSesion();
}

class _EstadoPantallaInicioSesion extends State<PantallaInicioSesion> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final String validaremail = "jdmolinar@unah.edu.hn";
  final String validarcontrasena = "123456";

  void Inicio() {
    if (emailController.text == validaremail &&
        contrasenaController.text == validarcontrasena) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PantallaInicio(email: emailController.text)));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Credenciales incorrectas"),
          actions: [
            TextButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Iniciar Sesión")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Correo"),
            ),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: Inicio,
              child: Text("Iniciar Sesion"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaRegistro()),
                );
              },
              child: Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
