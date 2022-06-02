// To parse this JSON data, do
//
//     final jugadoresAme = jugadoresAmeFromMap(jsonString);

import 'dart:convert';

class General {
  General({
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
  List<TablaGeneral> response;

  factory General.fromJson(String str) => General.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory General.fromMap(Map<String, dynamic> json) => General(
        jugadoresAmeGet: json["get"],
        parameters: Parameters.fromMap(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromMap(json["paging"]),
        response: List<TablaGeneral>.from(
            json["response"].map((x) => TablaGeneral.fromMap(x))),
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

class TablaGeneral {
  TablaGeneral({
    required this.league,
  });

  League league;

  factory TablaGeneral.fromJson(String str) =>
      TablaGeneral.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TablaGeneral.fromMap(Map<String, dynamic> json) => TablaGeneral(
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
    required this.goalsDiff,
    required this.group,
    required this.form,
    required this.status,
    required this.description,
    required this.all,
    required this.home,
    required this.away,
    required this.update,
  });

  int rank;
  Team team;
  int points;
  int goalsDiff;
  String group;
  String form;
  String status;
  String description;
  All all;
  All home;
  All away;
  DateTime update;

  factory Standing.fromJson(String str) => Standing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Standing.fromMap(Map<String, dynamic> json) => Standing(
        rank: json["rank"],
        team: Team.fromMap(json["team"]),
        points: json["points"],
        goalsDiff: json["goalsDiff"],
        group: json["group"],
        form: json["form"],
        status: json["status"],
        description: json["description"],
        all: All.fromMap(json["all"]),
        home: All.fromMap(json["home"]),
        away: All.fromMap(json["away"]),
        update: DateTime.parse(json["update"]),
      );

  Map<String, dynamic> toMap() => {
        "rank": rank,
        "team": team.toMap(),
        "points": points,
        "goalsDiff": goalsDiff,
        "group": group,
        "form": form,
        "status": status,
        "description": description,
        "all": all.toMap(),
        "home": home.toMap(),
        "away": away.toMap(),
        "update": update.toIso8601String(),
      };
}

class All {
  All({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  int played;
  int win;
  int draw;
  int lose;
  Goals goals;

  factory All.fromJson(String str) => All.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory All.fromMap(Map<String, dynamic> json) => All(
        played: json["played"],
        win: json["win"],
        draw: json["draw"],
        lose: json["lose"],
        goals: Goals.fromMap(json["goals"]),
      );

  Map<String, dynamic> toMap() => {
        "played": played,
        "win": win,
        "draw": draw,
        "lose": lose,
        "goals": goals.toMap(),
      };
}

class Goals {
  Goals({
    required this.goalsFor,
    required this.against,
  });

  int goalsFor;
  int against;

  factory Goals.fromJson(String str) => Goals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Goals.fromMap(Map<String, dynamic> json) => Goals(
        goalsFor: json["for"],
        against: json["against"],
      );

  Map<String, dynamic> toMap() => {
        "for": goalsFor,
        "against": against,
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
