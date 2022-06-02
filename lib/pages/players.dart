// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_futbol/pages/playinfo.dart';

import '../services/football_service.dart';

class Players extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);

    if (footballDataService.propiedadesJugadores.isEmpty) {
      return Container(
          color: Color(0xFF10203c),
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xFFeeeaa0)),
          ));
    }

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.separated(
              itemCount:
                  footballDataService.propiedadesJugadores[0].players.length,
              itemBuilder: (
                context,
                index,
              ) {
                var posicion = footballDataService
                    .propiedadesJugadores[0].players[index].position;
                var nombre = footballDataService
                    .propiedadesJugadores[0].players[index].name;
                var numero = footballDataService
                    .propiedadesJugadores[0].players[index].number
                    .toString();
                var edad = footballDataService
                    .propiedadesJugadores[0].players[index].age
                    .toString();

                posicion = posicion.replaceAll('Goalkeeper', 'Portero');
                posicion = posicion.replaceAll('Defender', 'Defensa');
                posicion = posicion.replaceAll('Midfielder', 'Mediocampista');
                posicion = posicion.replaceAll('Attacker', 'Delantero');

                return Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: ListTile(
                    onTap: () {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (index) => PlayerInfo(
                                    nombre: nombre,
                                    posicion: posicion,
                                    numero: numero,
                                    edad: edad,
                                  )));*/
                    },
                    title: Text(nombre),
                    subtitle: Text(posicion,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 138, 138, 138),
                            fontSize: 12)),
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image(
                          image: NetworkImage(footballDataService
                              .propiedadesJugadores[0].players[index].photo),
                        )),
                    trailing: Text(
                      numero.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: Colors.black,
                );
              },
            )));
  }
}
