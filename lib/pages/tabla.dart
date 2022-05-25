import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_futbol/services/football_service.dart';

class Tabla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);
    //print(footballDataService.propiedadesJugador[0].country);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tabla General Liga MX ',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
      body: Container(
        child: Text(''),
      ),
    );
  }
}
