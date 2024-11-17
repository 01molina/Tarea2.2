import 'package:flutter/material.dart';
import 'package:tarea2_2/Pantalla_Inicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicacion Inicio de Sesion',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: PantallaInicioSesion(),
    );
  }
}
