import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/football_service.dart';

class Partidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);

    if (footballDataService.propiedadesPartidos.isEmpty) {
      return Container(
          color: Color(0xFF10203c),
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xFFeeeaa0)),
          ));
    }

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              itemCount: footballDataService.propiedadesPartidos.length,
              itemBuilder: (
                context,
                index,
              ) {
                var equipoCasa = footballDataService
                    .propiedadesPartidos[index].homeTeam.teamName;
                var equipoVisita = footballDataService
                    .propiedadesPartidos[index].awayTeam.teamName;
                var equipoCasaImg = footballDataService
                    .propiedadesPartidos[index].homeTeam.logo;
                var equipoVisitaImg = footballDataService
                    .propiedadesPartidos[index].awayTeam.logo;
                var golCasa = footballDataService
                    .propiedadesPartidos[index].goalsHomeTeam;
                var golVisita = footballDataService
                    .propiedadesPartidos[index].goalsAwayTeam;
                var tiempo =
                    footballDataService.propiedadesPartidos[index].elapsed;
                var estatus =
                    footballDataService.propiedadesPartidos[index].status;

                if (golCasa & golVisita == null) {
                  golCasa = 0;
                  golVisita = 0;
                }
                estatus = estatus.replaceAll('Match Finished', 'Terminado');

                return Card(
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            equipoCasa,
                            textAlign: TextAlign.center,
                          )),
                          Image(
                            image: NetworkImage(equipoCasaImg),
                            fit: BoxFit.fill,
                            width: 35,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                golCasa.toString() +
                                    " - " +
                                    golVisita.toString(),
                                textAlign: TextAlign.center,
                              ),
                              Text(estatus, textAlign: TextAlign.center)
                            ],
                          )),
                          Image(
                            image: NetworkImage(equipoVisitaImg),
                            fit: BoxFit.fill,
                            width: 35,
                          ),
                          Expanded(
                              child: Text(
                            equipoVisita,
                            textAlign: TextAlign.center,
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
