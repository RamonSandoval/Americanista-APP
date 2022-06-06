import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../models/apertura22_modal.dart';
import '../services/football_service.dart';

class Partidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future getServiceApertura() async {
      const String _urlBaseSports = 'api-football-v1.p.rapidapi.com';
      const String _apiKeySports =
          '069c410e33msh94b5d9703c72a69p1cd47djsn5f6506384e39';
      List<Apertura22> propiedadesApertura = [];
      final url = Uri.https(_urlBaseSports, '/v2/fixtures/team/2287/next/20');
      final respuesta =
          await http.get(url, headers: {'X-RapidApi-Key': _apiKeySports});

      final jugadores = AperturaPartidos.fromJson(respuesta.body);
      propiedadesApertura = jugadores.api.fixtures;
    }

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
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            child: RefreshIndicator(
              onRefresh: getServiceApertura,
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

                  tiempo =
                      tiempo.toString().replaceAll('0', 'Fecha: ' + nuevaFecha);

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
                  equipoVisita =
                      equipoVisita.replaceAll('Tigres UANL', 'Tigres');
                  equipoCasa = equipoCasa.replaceAll('Tigres UANL', 'Tigres');
                  equipoVisita =
                      equipoVisita.replaceAll('Atletico San Luis', 'San Luis');
                  equipoCasa =
                      equipoCasa.replaceAll('Atletico San Luis', 'San Luis');
                  equipoVisita =
                      equipoVisita.replaceAll('Santos Laguna', 'Santos');
                  equipoCasa = equipoCasa.replaceAll('Santos Laguna', 'Santos');

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
                              fontSize: 23,
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
                                golCasa.toString() +
                                    " - " +
                                    golVisita.toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bebasNeue(
                                    textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 29,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.normal,
                                )),
                              ),
                              Text(
                                tiempo.toString(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.bebasNeue(
                                    textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
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
                              fontSize: 23,
                              letterSpacing: 1,
                              fontWeight: FontWeight.normal,
                            )),
                          )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }
}
