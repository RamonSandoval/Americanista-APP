import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_futbol/models/ptrophy_modal.dart';

class FootBallServices extends ChangeNotifier {
  final String _urlBase = 'api-football-v1.p.rapidapi.com';
  final String _apiKey = '069c410e33msh94b5d9703c72a69p1cd47djsn5f6506384e39';

  List<Response> propiedadesJugador = [];

  FootBallServices() {
    getServicePlayer();
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
