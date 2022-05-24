import 'package:flutter/material.dart';
import 'package:proyecto_futbol/pages/open.dart';
import 'package:proyecto_futbol/pages/player.dart';
import 'package:proyecto_futbol/routes/routes.dart';

abstract class MovPage {
  static Map<String, Widget Function(BuildContext)> route = {
    Routes.torneos: (BuildContext context) => Player(),
  };
}
