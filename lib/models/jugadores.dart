// To parse this JSON data, do
//
//     final jugadoresAme = jugadoresAmeFromMap(jsonString);

import 'dart:convert';

class JugadoresAme {
  JugadoresAme({
    required this.jugadoresAmeGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String jugadoresAmeGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Jugadores> response;

  factory JugadoresAme.fromJson(String str) =>
      JugadoresAme.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JugadoresAme.fromMap(Map<String, dynamic> json) => JugadoresAme(
        jugadoresAmeGet: json["get"],
        parameters: Parameters.fromMap(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromMap(json["paging"]),
        response: List<Jugadores>.from(
            json["response"].map((x) => Jugadores.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "get": jugadoresAmeGet,
        "parameters": parameters.toMap(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toMap(),
        "response": List<dynamic>.from(response.map((x) => x.toMap())),
      };
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  int current;
  int total;

  factory Paging.fromJson(String str) => Paging.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paging.fromMap(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current": current,
        "total": total,
      };
}

class Parameters {
  Parameters({
    required this.team,
  });

  String team;

  factory Parameters.fromJson(String str) =>
      Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
        team: json["team"],
      );

  Map<String, dynamic> toMap() => {
        "team": team,
      };
}

class Jugadores {
  Jugadores({
    required this.team,
    required this.players,
  });

  Team team;
  List<Player> players;

  factory Jugadores.fromJson(String str) => Jugadores.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Jugadores.fromMap(Map<String, dynamic> json) => Jugadores(
        team: Team.fromMap(json["team"]),
        players:
            List<Player>.from(json["players"].map((x) => Player.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "team": team.toMap(),
        "players": List<dynamic>.from(players.map((x) => x.toMap())),
      };
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.age,
    required this.number,
    required this.position,
    required this.photo,
  });

  int id;
  String name;
  int age;
  int number;
  String position;
  String photo;

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        number: json["number"],
        position: json["position"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "age": age,
        "number": number,
        "position": position,
        "photo": photo,
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
