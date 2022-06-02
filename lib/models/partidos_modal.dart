// To parse this JSON data, do
//
//     final partidos = partidosFromMap(jsonString);

import 'dart:convert';

class Partidos {
  Partidos({
    required this.api,
  });

  Api api;

  factory Partidos.fromJson(String str) => Partidos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Partidos.fromMap(Map<String, dynamic> json) => Partidos(
        api: Api.fromMap(json["api"]),
      );

  Map<String, dynamic> toMap() => {
        "api": api.toMap(),
      };
}

class Api {
  Api({
    required this.results,
    required this.fixtures,
  });

  int results;
  List<PartidosLista> fixtures;

  factory Api.fromJson(String str) => Api.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Api.fromMap(Map<String, dynamic> json) => Api(
        results: json["results"],
        fixtures: List<PartidosLista>.from(
            json["fixtures"].map((x) => PartidosLista.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "results": results,
        "fixtures": List<dynamic>.from(fixtures.map((x) => x.toMap())),
      };
}

class PartidosLista {
  PartidosLista({
    required this.fixtureId,
    required this.leagueId,
    required this.league,
    required this.eventDate,
    required this.eventTimestamp,
    required this.firstHalfStart,
    required this.secondHalfStart,
    required this.round,
    required this.status,
    required this.statusShort,
    required this.elapsed,
    required this.venue,
    required this.referee,
    required this.homeTeam,
    required this.awayTeam,
    required this.goalsHomeTeam,
    required this.goalsAwayTeam,
    required this.score,
  });

  int fixtureId;
  int leagueId;
  League league;
  DateTime eventDate;
  int eventTimestamp;
  int firstHalfStart;
  int secondHalfStart;
  String round;
  String status;
  String statusShort;
  int elapsed;
  String venue;
  String referee;
  Team homeTeam;
  Team awayTeam;
  int goalsHomeTeam;
  int goalsAwayTeam;
  Score score;

  factory PartidosLista.fromJson(String str) =>
      PartidosLista.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PartidosLista.fromMap(Map<String, dynamic> json) => PartidosLista(
        fixtureId: json["fixture_id"],
        leagueId: json["league_id"],
        league: League.fromMap(json["league"]),
        eventDate: DateTime.parse(json["event_date"]),
        eventTimestamp: json["event_timestamp"],
        firstHalfStart: json["firstHalfStart"],
        secondHalfStart: json["secondHalfStart"],
        round: json["round"],
        status: json["status"],
        statusShort: json["statusShort"],
        elapsed: json["elapsed"],
        venue: json["venue"],
        referee: json["referee"],
        homeTeam: Team.fromMap(json["homeTeam"]),
        awayTeam: Team.fromMap(json["awayTeam"]),
        goalsHomeTeam: json["goalsHomeTeam"],
        goalsAwayTeam: json["goalsAwayTeam"],
        score: Score.fromMap(json["score"]),
      );

  Map<String, dynamic> toMap() => {
        "fixture_id": fixtureId,
        "league_id": leagueId,
        "league": league,
        "event_date": eventDate.toIso8601String(),
        "event_timestamp": eventTimestamp,
        "firstHalfStart": firstHalfStart,
        "secondHalfStart": secondHalfStart,
        "round": round,
        "status": status,
        "statusShort": statusShort,
        "elapsed": elapsed,
        "venue": venue,
        "referee": referee,
        "homeTeam": homeTeam.toMap(),
        "awayTeam": awayTeam.toMap(),
        "goalsHomeTeam": goalsHomeTeam,
        "goalsAwayTeam": goalsAwayTeam,
        "score": score.toMap(),
      };
}

class Team {
  Team({
    required this.teamId,
    required this.teamName,
    required this.logo,
  });

  int teamId;
  String teamName;
  String logo;

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        teamId: json["team_id"],
        teamName: json["team_name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "team_id": teamId,
        "team_name": teamName,
        "logo": logo,
      };
}

class League {
  League({
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
  });

  String name;
  String country;
  String logo;
  String flag;

  factory League.fromJson(String str) => League.fromMap(json.decode(str));

  factory League.fromMap(Map<String, dynamic> json) => League(
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
      );
}

enum Country { MEXICO }

enum Name { LIGA_MX }

class Score {
  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  String halftime;
  String fulltime;
  dynamic extratime;
  dynamic penalty;

  factory Score.fromJson(String str) => Score.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Score.fromMap(Map<String, dynamic> json) => Score(
        halftime: json["halftime"],
        fulltime: json["fulltime"],
        extratime: json["extratime"],
        penalty: json["penalty"],
      );

  Map<String, dynamic> toMap() => {
        "halftime": halftime,
        "fulltime": fulltime,
        "extratime": extratime,
        "penalty": penalty,
      };
}
