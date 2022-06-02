import 'package:flutter/material.dart';

class PlayerInfo extends StatelessWidget {
  final nombre;
  final numero;
  final posicion;
  final edad;

  const PlayerInfo(
      {Key? key,
      required this.nombre,
      required this.posicion,
      required this.numero,
      required this.edad});

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
        child:
            Text((edad), style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
    );
  }
}
