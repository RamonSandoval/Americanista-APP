import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
//REMPLAZOS PARA NOMBRES DE EQUIPOS
                equipoVisita = equipoVisita.replaceAll('U.N.A.M. -', '');
                equipoCasa = equipoCasa.replaceAll('U.N.A.M. -', '');
                equipoVisita =
                    equipoVisita.replaceAll('Club America', 'America');
                equipoCasa = equipoCasa.replaceAll('Club America', 'America');
                equipoVisita.replaceAll('Club Tijuana', 'Tijuana');
                equipoCasa = equipoCasa.replaceAll('Club Tijuana', 'Tijuana');
                equipoVisita.replaceAll('Los Angeles FC', 'LA FC');
                equipoCasa = equipoCasa.replaceAll('Los Angeles FC', 'LA FC');

                equipoVisita =
                    equipoVisita.replaceAll('Guadalajara Chivas', 'Chivas');
                equipoCasa =
                    equipoCasa.replaceAll('Guadalajara Chivas', 'Chivas');
                equipoVisita = equipoVisita.replaceAll('Tigres UANL', 'Tigres');
                equipoCasa = equipoCasa.replaceAll('Tigres UANL', 'Tigres');
                equipoVisita =
                    equipoVisita.replaceAll('Atletico San Luis', 'San Luis');
                equipoCasa =
                    equipoCasa.replaceAll('Atletico San Luis', 'San Luis');
                equipoVisita =
                    equipoVisita.replaceAll('Santos Laguna', 'Santos');
                equipoCasa = equipoCasa.replaceAll('Santos Laguna', 'Santos');
                equipoCasa =
                    equipoCasa.replaceAll('Club Queretaro', 'Queretaro');
                equipoVisita =
                    equipoVisita.replaceAll('Club Queretaro', 'Queretaro');

                if (golCasa & golVisita == null) {
                  golCasa = 0;
                  golVisita = 0;
                }
                estatus = estatus.replaceAll('Match Finished', 'Terminado');

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Color(0xFF10203c),
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          equipoCasa,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bebasNeue(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                          )),
                        )),
                        Image(
                          image: NetworkImage(equipoCasaImg),
                          fit: BoxFit.fill,
                          width: 30,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              golCasa.toString() + " - " + golVisita.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.bebasNeue(
                                  textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 29,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal,
                              )),
                            ),
                          ],
                        )),
                        Image(
                          image: NetworkImage(equipoVisitaImg),
                          fit: BoxFit.fill,
                          width: 30,
                        ),
                        Expanded(
                            child: Text(
                          equipoVisita,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bebasNeue(
                              textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                          )),
                        )),
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
