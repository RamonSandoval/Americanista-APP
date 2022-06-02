import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_futbol/models/alineacion_modal.dart';
import 'package:proyecto_futbol/models/apertura22_modal.dart';
import 'package:proyecto_futbol/models/jugadores.dart';
import 'package:proyecto_futbol/models/partidos_modal.dart';
import 'package:proyecto_futbol/models/tabla_general.dart';

class FootBallServices extends ChangeNotifier {
  final String _urlBase = 'api-football-v1.p.rapidapi.com';
  final String _apiKey = '069c410e33msh94b5d9703c72a69p1cd47djsn5f6506384e39';
  String season = '';

  List<AlineacionTabla> propiedadesAlineacion = [];
  List<Jugadores> propiedadesJugadores = [];
  List<TablaGeneral> propiedadesTabla = [];
  List<PartidosLista> propiedadesPartidos = [];
  List<Apertura22> propiedadesApertura = [];

  FootBallServices() {
    getServiceAlineacion();
    getServiceJugadores();
    getServicePartidos();
    getServiceApertura();
  }

  /* -------------------------------------------------------------------------------------- */
  //FUNCION QUE SE CONECTA A LA LISTA INFORMACION DE ALINEACION
  getServiceAlineacion() async {
    final url = Uri.https(_urlBase, '/v3/fixtures/lineups',
        {'fixture': '676200', 'team': '2287'});
    final respuesta = await http.get(url, headers: {'X-RapidApi-Key': _apiKey});

    final alineacion = Alineacion.fromJson(respuesta.body);
    propiedadesAlineacion = alineacion.response;
    notifyListeners();
  }

  /* -------------------------------------------------------------------------------------- */

  //FUNCION QUE SE CONECTA A LA LISTA INFORMACION DE JUGADORES
  getServiceJugadores() async {
    final url = Uri.https(_urlBase, '/v3/players/squads', {'team': '2287'});
    final respuesta = await http.get(url, headers: {'X-RapidApi-Key': _apiKey});

    final jugadores = JugadoresAme.fromJson(respuesta.body);
    propiedadesJugadores = jugadores.response;
    //print(propiedadesJugadores[0].players[0].name);
    notifyListeners();
  }

  /* -------------------------------------------------------------------------------------- */
  getServiceApertura() async {
    final url = Uri.https(_urlBase, '/v2/fixtures/team/2287/next/20');
    final respuesta = await http.get(url, headers: {'X-RapidApi-Key': _apiKey});

    final jugadores = AperturaPartidos.fromJson(respuesta.body);
    propiedadesApertura = jugadores.api.fixtures;
    print(propiedadesApertura[0].awayTeam.teamName);

    notifyListeners();
  }
  /*-------------------------------------------------------------------------------------- */

  getServicePartidos() async {
    final url = Uri.https(_urlBase, '/v2/fixtures/team/2287/last/15',
        {'timezone': 'America/Mexico_city'});
    final respuesta = await http.get(url, headers: {
      'X-RapidApi-Key': _apiKey,
      'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
    });

    final partidos = Partidos.fromJson(respuesta.body);
    propiedadesPartidos = partidos.api.fixtures;
    // print(propiedadesPartidos[0].homeTeam.teamName);
    notifyListeners();
  }
}
