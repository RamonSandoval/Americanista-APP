// To parse this JSON data, do
//
//     final tablaGeneral = tablaGeneralFromMap(jsonString);

import 'dart:convert';

class TablaGeneral {
  TablaGeneral({
    required this.tablaGeneralGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String tablaGeneralGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Tabla> response;

  factory TablaGeneral.fromJson(String str) =>
      TablaGeneral.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TablaGeneral.fromMap(Map<String, dynamic> json) => TablaGeneral(
        tablaGeneralGet: json["get"],
        parameters: Parameters.fromMap(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromMap(json["paging"]),
        response:
            List<Tabla>.from(json["response"].map((x) => Tabla.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "get": tablaGeneralGet,
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
    required this.league,
    required this.season,
  });

  String league;
  String season;

  factory Parameters.fromJson(String str) =>
      Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
        league: json["league"],
        season: json["season"],
      );

  Map<String, dynamic> toMap() => {
        "league": league,
        "season": season,
      };
}

class Tabla {
  Tabla({
    required this.league,
  });

  League league;

  factory Tabla.fromJson(String str) => Tabla.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tabla.fromMap(Map<String, dynamic> json) => Tabla(
        league: League.fromMap(json["league"]),
      );

  Map<String, dynamic> toMap() => {
        "league": league.toMap(),
      };
}

class League {
  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.standings,
  });

  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  List<List<Standing>> standings;

  factory League.fromJson(String str) => League.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory League.fromMap(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        standings: List<List<Standing>>.from(json["standings"].map(
            (x) => List<Standing>.from(x.map((x) => Standing.fromMap(x))))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "standings": List<dynamic>.from(
            standings.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
      };
}

class Standing {
  Standing({
    required this.rank,
    required this.team,
    required this.points,
  });

  int rank;
  Team team;
  int points;

  factory Standing.fromJson(String str) => Standing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Standing.fromMap(Map<String, dynamic> json) => Standing(
        rank: json["rank"],
        team: Team.fromMap(json["team"]),
        points: json["points"],
      );

  Map<String, dynamic> toMap() => {
        "rank": rank,
        "team": team.toMap(),
        "points": points,
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
