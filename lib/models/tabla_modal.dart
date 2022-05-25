// To parse this JSON data, do
//
//     final tablaGeneral = tablaGeneralFromMap(jsonString);

import 'dart:convert';

class TablaGeneral {
  TablaGeneral({
    required this.standings,
  });

  List<List<Standing>>? standings;

  factory TablaGeneral.fromJson(String str) =>
      TablaGeneral.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TablaGeneral.fromMap(Map<String, dynamic> json) => TablaGeneral(
        standings: List<List<Standing>>.from(json["standings"].map(
            (x) => List<Standing>.from(x.map((x) => Standing.fromMap(x))))),
      );

  Map<String, dynamic> toMap() => {
        "standings": List<dynamic>.from(
            standings!.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
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
