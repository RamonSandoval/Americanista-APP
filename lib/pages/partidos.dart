import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../services/football_service.dart';

class Partidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);

    if (footballDataService.propiedadesApertura.isEmpty) {
      return Container(
          color: Color(0xFF10203c),
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xFFeeeaa0)),
          ));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Partidos Apertura 2022',
          ),
          backgroundColor: Color(0xFF10203c),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              itemCount: footballDataService.propiedadesApertura.length,
              itemBuilder: (
                context,
                index,
              ) {
                var equipoCasa = footballDataService
                    .propiedadesApertura[index].homeTeam.teamName;
                var equipoVisita = footballDataService
                    .propiedadesApertura[index].awayTeam.teamName;
                var equipoCasaImg = footballDataService
                    .propiedadesApertura[index].homeTeam.logo;
                var equipoVisitaImg = footballDataService
                    .propiedadesApertura[index].awayTeam.logo;
                var golCasa = footballDataService
                    .propiedadesApertura[index].goalsHomeTeam;
                var golVisita = footballDataService
                    .propiedadesApertura[index].goalsAwayTeam;
                var tiempo = footballDataService
                    .propiedadesApertura[index].elapsed
                    .toString();
                var estatus =
                    footballDataService.propiedadesApertura[index].status;
                var fecha =
                    footballDataService.propiedadesApertura[index].eventDate;

                var date = fecha;
                var newDate = new DateTime(date.day, date.month);

                golCasa ??= 0;
                golVisita ??= 0;

                var nuevaFecha;
                nuevaFecha = tiempo.toString().replaceAll(
                    '0', date.day.toString() + " - " + date.month.toString());

                tiempo = tiempo.toString().replaceAll('0', '');

                estatus = estatus.replaceAll('Not Started', '');
                estatus =
                    estatus.replaceAll('Time to be defined', 'Por definir');
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
                equipoVisita.replaceAll('Club Queretaro', 'Queretaro');
                equipoCasa =
                    equipoCasa.replaceAll('Club Queretaro', 'Queretaro');
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

                return Card(
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            equipoCasa,
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          )),
                          Image(
                            image: NetworkImage(equipoCasaImg),
                            fit: BoxFit.fill,
                            width: 30,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                golCasa.toString() +
                                    " - " +
                                    golVisita.toString(),
                                style: TextStyle(fontSize: 23),
                                textAlign: TextAlign.center,
                              ),
                              Text(tiempo.toString(),
                                  textAlign: TextAlign.center),
                              Text('Fecha: ' + nuevaFecha.toString()),
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
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
