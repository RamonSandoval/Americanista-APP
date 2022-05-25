import 'dart:convert';

class Jugador {
  Jugador({
    required this.response,
  });

  List<Response> response;

  factory Jugador.fromJson(String str) => Jugador.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Jugador.fromMap(Map<String, dynamic> json) => Jugador(
        response: List<Response>.from(
            json["response"].map((x) => Response.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "response": List<dynamic>.from(response.map((x) => x.toMap())),
      };
}

class Response {
  Response({
    required this.league,
    required this.country,
    required this.season,
    required this.place,
  });

  String league;
  String country;
  String season;
  String place;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Response.fromMap(Map<String, dynamic> json) => Response(
        league: json["league"],
        country: json["country"],
        season: json["season"],
        place: json["place"],
      );

  Map<String, dynamic> toMap() => {
        "league": league,
        "country": country,
        "season": season,
        "place": place,
      };
}
