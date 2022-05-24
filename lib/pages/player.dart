import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_futbol/services/ptrophy_service.dart';
// ignore_for_file: prefer_const_constructors

class Player extends StatelessWidget {
  static const int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);
    //print(footballDataService.propiedadesJugador[0].country);

    if (footballDataService.propiedadesJugador.isEmpty) {
      return Container(
          color: Color(0xFF10203c),
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xFFeeeaa0)),
          ));
    }

    return Scaffold(
      backgroundColor: Color(0xFFeeeaa0),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Portero Club America ',
        ),
        backgroundColor: Color(0xFF10203c),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Column(
            children: [
              const Center(
                  //child: Text(footballDataService.propiedadesJugador[3].country),
                  ),
              CircleAvatar(
                radius: 120.0,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/FSwmXK6WAAEdQ7f?format=jpg&name=medium'),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Guillermo Ochoa",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              //LIGA
              ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxWjdLqETaAkC9_DzUyZI30v4C-bf1djHEuMz7af_LGuXRqFOIFQO0C2n4TgPJjwCHz1g&usqp=CAU'),
                ),
                tileColor: Color(0xFF10203c),
                title: Text(footballDataService.propiedadesJugador[3].league,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                subtitle: Text(
                  "Liga para la que juega",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //PAIS
              ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/1280px-Flag_of_Mexico.svg.png'),
                ),
                tileColor: Color(0xFF10203c),
                title: Text(footballDataService.propiedadesJugador[3].country,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                subtitle: Text(
                  "Pais",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //TROFEO
              ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/ad/3a/4c/ad3a4c205ca5b86d0aebd3393138aecf.jpg'),
                ),
                tileColor: Color(0xFF10203c),
                title: Text(footballDataService.propiedadesJugador[3].place,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                subtitle: Text(
                  "Trofeo de la Liga Mx",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //TROFEO
              ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://s3.us-west-2.amazonaws.com/v2.clubamerica.com.mx/portal/wp-content/uploads/2021/05/club-america.png'),
                ),
                tileColor: Color(0xFF10203c),
                title: Text(footballDataService.propiedadesJugador[3].season,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                subtitle: Text(
                  "Temporada",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
