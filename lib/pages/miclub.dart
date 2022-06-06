// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_futbol/pages/Alineacion.dart';
import 'package:proyecto_futbol/pages/partidos_ant.dart';
import 'package:proyecto_futbol/pages/players.dart';
import 'package:proyecto_futbol/services/football_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabla extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Mi Club',
              ),
              backgroundColor: Color(0xFF10203c),
              bottom: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                indicatorColor: Colors.yellow,
                tabs: [
                  Tab(
                    text: 'Plantilla',
                  ),
                  Tab(
                    text: '11 Ideal',
                  ),
                  Tab(
                    text: 'Partidos',
                  )
                ],
              )),
          body: TabBarView(
            children: [
              Center(child: Players()),
              Center(child: Alineacion()),
              Center(child: Partidos()),
            ],
          )));
}

class TablaGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);
    //print(footballDataService.propiedadesJugador[0].country);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posiciones Primera División',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
    );
  }
}

class TablaAmerica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);
    //print(footballDataService.propiedadesJugador[0].country);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estadisticas America',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
      body: Center(
        child: Text("ds", style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
    );
  }
}
