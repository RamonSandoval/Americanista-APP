import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_futbol/models/alineacion_modal.dart';
import 'package:proyecto_futbol/models/estadio_modal.dart';
import 'package:proyecto_futbol/models/jugadores.dart';

class FootBallServices extends ChangeNotifier {
  final String _urlBase = 'api-football-v1.p.rapidapi.com';
  final String _apiKey = '069c410e33msh94b5d9703c72a69p1cd47djsn5f6506384e39';

  List<EstadioInfo> propiedadesEstadio = [];
  List<AlineacionTabla> propiedadesAlineacion = [];
  List<Jugadores> propiedadesJugadores = [];

  FootBallServices() {
    getServiceEstadio();
    getServiceAlineacion();
    getServiceJugadores();
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
    print(propiedadesJugadores[0].players[0].name);
    notifyListeners();
  }

  /* -------------------------------------------------------------------------------------- */
  //FUNCION QUE SE CONECTA A LA LISTA INFORMACION DEL ESTADIO
  getServiceEstadio() async {
    final url = Uri.https(_urlBase, '/v3/teams', {'id': '2287'});
    final respuesta = await http.get(url, headers: {'X-RapidApi-Key': _apiKey});

    final estadio = Estadio.fromJson(respuesta.body);
    propiedadesEstadio = estadio.response;
    //print(propiedadesEstadio[0].team.founded);

    notifyListeners();
  }

  /* -------------------------------------------------------------------------------------- */

  /*-------------------------------------------------------------------------------------- */
}
