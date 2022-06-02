// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/football_service.dart';

class Alineacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);

    if (footballDataService.propiedadesAlineacion.isEmpty &&
        footballDataService.propiedadesJugadores.isEmpty) {
      return Container(
          color: Color(0xFF10203c),
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xFFeeeaa0)),
          ));
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/campo.jpg'), fit: BoxFit.fill),
        ),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Column(children: [
            ClipOval(
              child: Image(
                  height: 50,
                  width: 50,
                  image: NetworkImage(footballDataService
                      .propiedadesJugadores[0].players[31].photo)),
            ),
            Text(
              footballDataService
                  .propiedadesAlineacion[0].startXi[10].player.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[21].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[5].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
              SizedBox(
                width: 120,
              ),
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[23].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[8].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[20].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[9].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[16].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[6].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(children: [
            ClipOval(
              child: Image(
                  height: 50,
                  width: 50,
                  image: NetworkImage(footballDataService
                      .propiedadesJugadores[0].players[18].photo)),
            ),
            Text(
              footballDataService
                  .propiedadesAlineacion[0].startXi[7].player.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[3].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[1].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[6].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[2].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[5].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[4].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[4].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[3].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                ClipOval(
                  child: Image(
                      height: 50,
                      width: 50,
                      image: NetworkImage(footballDataService
                          .propiedadesJugadores[0].players[0].photo)),
                ),
                Text(
                  footballDataService
                      .propiedadesAlineacion[0].startXi[0].player.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
