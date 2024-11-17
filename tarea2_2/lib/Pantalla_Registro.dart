import 'package:flutter/material.dart';

class PantallaRegistro extends StatefulWidget {
  @override
  _EstadoPantallaRegistro createState() => _EstadoPantallaRegistro();
}

class _EstadoPantallaRegistro extends State<PantallaRegistro> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final TextEditingController confirmarContrasenaController =
      TextEditingController();

  void Registro() {
    final nombre = nombreController.text;
    final email = emailController.text;
    final telefono = telefonoController.text;
    final contrasena = contrasenaController.text;
    final confirmarContrasena = confirmarContrasenaController.text;

    if (nombre.length < 3 || nombre.length > 10) {
      showMessage("El nombre debe tener entre 3 y 10 caracteres");
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@unah\.edu\.hn$').hasMatch(email)) {
      showMessage("Correo no válido");
      return;
    }

    if (!RegExp(r'^(3|9)\d{7}$').hasMatch(telefono)) {
      showMessage("Teléfono no válido");
      return;
    }

    if (contrasena.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(contrasena) ||
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(contrasena)) {
      showMessage(
          "La contraseña debe tener al menos una mayúscula y un carácter especial");
      return;
    }

    if (contrasena != confirmarContrasena) {
      showMessage("Las contraseñas no coinciden");
      return;
    }
    print("Nombre: $nombre");
    print("Correo: $email");
    print("Telefono: $telefono");
    print("Contraseña: $contrasena");
  }

  void showMessage(String mensaje) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(title: Text("Error"), content: Text(mensaje), actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Aceptar"),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrarse")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Correo"),
            ),
            TextField(
              controller: telefonoController,
              decoration: InputDecoration(labelText: "Teléfono"),
            ),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            TextField(
              controller: confirmarContrasenaController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Confirmar contraseña"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: Registro,
              child: Text("Registrarte"),
            ),
          ],
        ),
      ),
    );
  }
}
