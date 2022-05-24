import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_futbol/pages/player.dart';
import 'package:proyecto_futbol/routes/routes.dart';

class Usuario extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];

  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  @override
  Widget build(BuildContext context) {
    //print(footballDataService.propiedadesJugador[0].country);

    return Scaffold(
      backgroundColor: Color(0xFFeeeaa0),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mi Cuenta',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
    );
  }
}
