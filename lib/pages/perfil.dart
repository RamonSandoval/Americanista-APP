import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Perfil extends StatelessWidget {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'BIENVENIDO AFICIONADO AMERICANISTA',
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Color(0xFF10203c),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/fondo_perfil.png'),
                  fit: BoxFit.fill)),
          /*child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text('Ya logro juntar $_count monedas.')),
                      FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          _count++;
                        },
                        tooltip: 'Monedas',
                        child:
                            Image(image: AssetImage('assets/img/moneda.png')),
                      ),
                    ],
                  ),
                ])*/
        ));
  }
}
