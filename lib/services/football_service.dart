import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_futbol/models/ptrophy_modal.dart';

import '../models/tabla_modal.dart';

class FootBallServices extends ChangeNotifier {
  final String _urlBase = 'api-football-v1.p.rapidapi.com';
  final String _apiKey = '069c410e33msh94b5d9703c72a69p1cd47djsn5f6506384e39';

  List<Response> propiedadesJugador = [];
  List<Tabla> propiedadesTabla = [];

  FootBallServices() {
    getServicePlayer();
    getServiceTabla();
  }

  //Funcion que se conecta a la api lista tabla
  getServiceTabla() async {
    final url = Uri.https(
        _urlBase, '/v3/standings', {'season': '2021', 'league': '262'});
    final respuesta = await http.get(url, headers: {'X-RapidApi-Key': _apiKey});

    final tabla = TablaGeneral.fromJson(respuesta.body);
    propiedadesTabla = tabla.tablaGeneralGet as List<Tabla>;
    print(propiedadesJugador);
  }

//Funcion que se conecta a la api lista de player
  getServicePlayer() async {
    final url = Uri.https(_urlBase, '/v3/trophies', {'player': '2098'});
    final respuesta = await http.get(url, headers: {'X-RapidApi-Key': _apiKey});

    final equipo = Jugador.fromJson(respuesta.body);
    propiedadesJugador = equipo.response;
    notifyListeners();
  }
}
