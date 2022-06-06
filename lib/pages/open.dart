import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_futbol/pages/Alineacion.dart';
import 'package:proyecto_futbol/pages/noticias.dart';
import 'package:proyecto_futbol/pages/perfil.dart';
import 'package:proyecto_futbol/pages/players.dart';
import 'package:proyecto_futbol/pages/miclub.dart';
import 'package:proyecto_futbol/pages/partidos.dart';
import 'package:proyecto_futbol/pages/login.dart';
import 'package:proyecto_futbol/routes/routes.dart';

class OpenMain extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];
  @override
  State<OpenMain> createState() => _OpenMainState();
}

class _OpenMainState extends State<OpenMain> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Inicio(),
    Tabla(),
    Partidos(),
    Perfil(),
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
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper_outlined,
                size: 20,
                color: Color(0xFF192441),
              ),
              label: 'Noticias',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_soccer_outlined,
                size: 20,
                color: Color(0xFF192441),
              ),
              label: 'Mi Club',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.table_rows_outlined,
                size: 20,
                color: Color(0xFF192441),
              ),
              label: 'Apertura 22',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 20,
                color: Color(0xFF192441),
              ),
              label: 'Perfil',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF10203c),
          selectedLabelStyle: GoogleFonts.bebasNeue(
              textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 1,
            fontWeight: FontWeight.normal,
          )),
          unselectedLabelStyle: GoogleFonts.bebasNeue(
              textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            letterSpacing: 1,
            fontWeight: FontWeight.normal,
          )),
          onTap: onTabTapped,
        ));
  }
}
