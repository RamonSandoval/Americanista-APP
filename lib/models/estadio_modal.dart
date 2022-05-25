// To parse this JSON data, do
//
//     final estadio = estadioFromMap(jsonString);

import 'dart:convert';

class Estadio {
  Estadio({
    required this.estadioGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });

  String estadioGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<EstadioInfo> response;

  factory Estadio.fromJson(String str) => Estadio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Estadio.fromMap(Map<String, dynamic> json) => Estadio(
        estadioGet: json["get"],
        parameters: Parameters.fromMap(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromMap(json["paging"]),
        response: List<EstadioInfo>.from(
            json["response"].map((x) => EstadioInfo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "get": estadioGet,
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
    required this.id,
  });

  String id;

  factory Parameters.fromJson(String str) =>
      Parameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Parameters.fromMap(Map<String, dynamic> json) => Parameters(
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
      };
}

class EstadioInfo {
  EstadioInfo({
    required this.team,
    required this.venue,
  });

  Team team;
  Venue venue;

  factory EstadioInfo.fromJson(String str) =>
      EstadioInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EstadioInfo.fromMap(Map<String, dynamic> json) => EstadioInfo(
        team: Team.fromMap(json["team"]),
        venue: Venue.fromMap(json["venue"]),
      );

  Map<String, dynamic> toMap() => {
        "team": team.toMap(),
        "venue": venue.toMap(),
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.code,
    required this.country,
    required this.founded,
    required this.national,
    required this.logo,
  });

  int id;
  String name;
  String code;
  String country;
  int founded;
  bool national;
  String logo;

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        country: json["country"],
        founded: json["founded"],
        national: json["national"],
        logo: json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "code": code,
        "country": country,
        "founded": founded,
        "national": national,
        "logo": logo,
      };
}

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.surface,
    required this.image,
  });

  int id;
  String name;
  String address;
  String city;
  int capacity;
  String surface;
  String image;

  factory Venue.fromJson(String str) => Venue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Venue.fromMap(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        capacity: json["capacity"],
        surface: json["surface"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "capacity": capacity,
        "surface": surface,
        "image": image,
      };
}
