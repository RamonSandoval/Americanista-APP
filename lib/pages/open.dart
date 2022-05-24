import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_futbol/pages/inicio.dart';
import 'package:proyecto_futbol/pages/player.dart';
import 'package:proyecto_futbol/pages/tabla.dart';
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
  final List<Widget> _children = [Inicio(), Tabla(), Player(), Text("data")];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(footballDataService.propiedadesJugador[0].country);

    return Scaffold(
        backgroundColor: Color(0xFFeeeaa0),
        /*appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Americanista',
          ),
          backgroundColor: Color(0xFF10203c),
        ),
        */
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 20),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart, size: 20),
              label: 'Tabla',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_outlined,
                size: 20,
              ),
              label: 'Jugadores',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark_outlined, size: 20),
              label: 'Informacion',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF10203c),
          onTap: onTabTapped,
        ));
  }
}
