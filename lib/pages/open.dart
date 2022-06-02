import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_futbol/pages/Alineacion.dart';
import 'package:proyecto_futbol/pages/inicio.dart';
import 'package:proyecto_futbol/pages/players.dart';
import 'package:proyecto_futbol/pages/miclub.dart';
import 'package:proyecto_futbol/pages/partidos.dart';
import 'package:proyecto_futbol/pages/usuario.dart';
import 'package:proyecto_futbol/routes/routes.dart';

class OpenMain extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];
  @override
  State<OpenMain> createState() => _OpenMainState();
}

class _OpenMainState extends State<OpenMain> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    Inicio(),
    Tabla(),
    Partidos(),
    Usuario(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFeeeaa0),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 20),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_outlined, size: 20),
              label: 'Mi Club',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.table_rows_outlined,
                size: 20,
              ),
              label: 'Apertura 22',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, size: 20),
              label: 'Perfil',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF10203c),
          onTap: onTabTapped,
        ));
  }
}
