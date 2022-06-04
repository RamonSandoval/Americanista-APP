import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estadisticas America',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
      body: Center(
        child: Text("Bienvenido aficionado Americanista"),
      ),
    );
  }
}
