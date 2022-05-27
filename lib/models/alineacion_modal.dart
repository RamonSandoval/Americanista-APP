// To parse this JSON data, do
//
//     final alineacion = alineacionFromMap(jsonString);

import 'dart:convert';

class Alineacion {
  Alineacion({
    required this.alineacionGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String alineacionGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<AlineacionTabla> response;

  factory Alineacion.fromJson(String str) =>
      Alineacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Alineacion.fromMap(Map<String, dynamic> json) => Alineacion(
        alineacionGet: json["get"],
        parameters: Parameters.fromMap(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromMap(json["paging"]),
        response: List<AlineacionTabla>.from(
            json["response"].map((x) => AlineacionTabla.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "get": alineacionGet,
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
    required this.fixture,
    required this.team,
  });

  String fixture;
  String team;

  factory Parameters.fromJson(String str) =>
      Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
        fixture: json["fixture"],
        team: json["team"],
      );

  Map<String, dynamic> toMap() => {
        "fixture": fixture,
        "team": team,
      };
}

class AlineacionTabla {
  AlineacionTabla({
    required this.team,
    required this.coach,
    required this.formation,
    required this.startXi,
    required this.substitutes,
  });

  Team team;
  Coach coach;
  dynamic formation;
  List<StartXi> startXi;
  List<StartXi> substitutes;

  factory AlineacionTabla.fromJson(String str) =>
      AlineacionTabla.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlineacionTabla.fromMap(Map<String, dynamic> json) => AlineacionTabla(
        team: Team.fromMap(json["team"]),
        coach: Coach.fromMap(json["coach"]),
        formation: json["formation"],
        startXi:
            List<StartXi>.from(json["startXI"].map((x) => StartXi.fromMap(x))),
        substitutes: List<StartXi>.from(
            json["substitutes"].map((x) => StartXi.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "team": team.toMap(),
        "coach": coach.toMap(),
        "formation": formation,
        "startXI": List<dynamic>.from(startXi.map((x) => x.toMap())),
        "substitutes": List<dynamic>.from(substitutes.map((x) => x.toMap())),
      };
}

class Coach {
  Coach({
    required this.id,
    required this.name,
    required this.photo,
  });

  int id;
  String name;
  String photo;

  factory Coach.fromJson(String str) => Coach.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Coach.fromMap(Map<String, dynamic> json) => Coach(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "photo": photo,
      };
}

class StartXi {
  StartXi({
    required this.player,
  });

  Player player;

  factory StartXi.fromJson(String str) => StartXi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StartXi.fromMap(Map<String, dynamic> json) => StartXi(
        player: Player.fromMap(json["player"]),
      );

  Map<String, dynamic> toMap() => {
        "player": player.toMap(),
      };
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.number,
    required this.pos,
    required this.grid,
  });

  int id;
  String name;
  int number;
  dynamic pos;
  dynamic grid;

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        id: json["id"],
        name: json["name"],
        number: json["number"],
        pos: json["pos"],
        grid: json["grid"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "number": number,
        "pos": pos,
        "grid": grid,
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
    required this.colors,
  });

  int id;
  String name;
  String logo;
  dynamic colors;

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        colors: json["colors"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "logo": logo,
        "colors": colors,
      };
}
