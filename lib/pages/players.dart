import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    return MaterialApp(
        title: '',
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Jugadores',
              ),
              backgroundColor: Color(0xFF10203c),
            ),
            body: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                    itemCount: footballDataService
                        .propiedadesJugadores[0].players.length,
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

                      posicion = posicion.replaceAll('Goalkeeper', 'Portero');
                      posicion = posicion.replaceAll('Defender', 'Defensa');
                      posicion =
                          posicion.replaceAll('Midfielder', 'Mediocampista');
                      posicion = posicion.replaceAll('Attacker', 'Delantero');

                      return Container(
                        alignment: Alignment.center,
                        height: 90,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            onTap: () {},
                            title: Text(nombre),
                            subtitle: Text(posicion,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 138, 138, 138),
                                    fontSize: 12)),
                            leading: CircleAvatar(
                                child: Image(
                              image: NetworkImage(footballDataService
                                  .propiedadesJugadores[0]
                                  .players[index]
                                  .photo),
                            )),
                            trailing: Text(
                              numero.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    }))));
  }
}
