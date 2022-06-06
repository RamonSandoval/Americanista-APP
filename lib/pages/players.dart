// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: ListView.builder(
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
                  height: 80,
                  alignment: Alignment.center,
                  child: Card(
                    color: Color(0xFF192441),
                    shadowColor: Color(0xFF192441),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.elliptical(80, 120),
                          topRight: Radius.circular(25)),
                      side: BorderSide(
                        width: 3,
                        color: Color(0xFF192441),
                      ),
                    ),
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
                      title: Text(
                        nombre,
                        style: GoogleFonts.bebasNeue(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                        )),
                      ),
                      subtitle: Text(posicion,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 138, 138, 138),
                              fontSize: 12)),
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image(
                            image: NetworkImage(footballDataService
                                .propiedadesJugadores[0].players[index].photo),
                          )),
                      trailing: Text(
                        numero.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
              /*separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: Colors.black,
                );
              },*/
            )));
  }
}
