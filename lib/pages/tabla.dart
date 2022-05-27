// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_futbol/services/football_service.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabla extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Tabla General Liga MX ',
              ),
              backgroundColor: Color(0xFF10203c),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Tabla General',
                    icon: Icon(Icons.table_chart_outlined),
                  ),
                  Tab(
                    text: 'Tabla America',
                    icon: Icon(Icons.sports_soccer_outlined),
                  )
                ],
              )),
          body: TabBarView(
            children: [
              Center(child: TablaGeneral()),
              Center(child: TablaAmerica()),
            ],

            /*Card(
                child: InkWell(
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (__) => TablaGeneral());
                    Navigator.push(context, route);
                  },
                  child: Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/img/tabla_ligamx.png'))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (__) => TablaAmerica());
                    Navigator.push(context, route);
                  },
                  child: Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/img/tabla_ame.png'))),
                  ),
                ),
              ),*/
          )));
}

class TablaGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);
    //print(footballDataService.propiedadesJugador[0].country);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posiciones Primera División',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
    );
  }
}

class TablaAmerica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);
    //print(footballDataService.propiedadesJugador[0].country);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estadisticas America',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
      body: Center(
        child: Text(footballDataService.propiedadesEstadio[0].team.country,
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
    );
  }
}
