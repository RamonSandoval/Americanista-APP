// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/football_service.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballDataService = Provider.of<FootBallServices>(context);

    if (footballDataService.articles.isEmpty) {
      return Container(
          color: Color(0xFF10203c),
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xFFeeeaa0)),
          ));
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            ' NOTICIAS DEPORTIVAS ',
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Color(0xFF10203c),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (
                context,
                index,
              ) {
                var autor = footballDataService.articles[index].author;
                var titulo = footballDataService.articles[index].title;
                var imagen = footballDataService.articles[index].urlToImage;
                var linkNoticia = footballDataService.articles[index].url;
                var fecha = footballDataService.articles[index].publishedAt;

                var date = fecha;
                var newDate = new DateTime(date.day, date.month);

                final Uri _url = Uri.parse(linkNoticia);

                void _launchURL() async {
                  if (!await launchUrl(_url)) throw 'Error al abrir $_url';
                }

                String desconocido = 'Desconocido';

                if (autor == 'null') {
                  autor = desconocido;
                }

                if (imagen == 'null') {
                  imagen =
                      'https://es.calcuworld.com/wp-content/uploads/sites/2/2018/04/medidas-de-un-campo-de-futbol.jpg';
                }

                return InkWell(
                  onTap: _launchURL,
                  child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        height: 130,
                        padding: const EdgeInsets.only(left: 6),
                        child: Row(children: [
                          Expanded(
                            flex: 12,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  image: DecorationImage(
                                      image: NetworkImage(imagen),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 15,
                            child: Container(
                              padding: const EdgeInsets.only(right: 3, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    titulo,
                                    style: GoogleFonts.bebasNeue(
                                        textStyle: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    )),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          child: Text(autor,
                                              style: GoogleFonts.bebasNeue(
                                                  textStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 110, 110, 110),
                                                fontSize: 8,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.normal,
                                              )))),
                                      FlatButton(
                                        onPressed: null,
                                        child: Text(
                                            date.day.toString() +
                                                "-" +
                                                date.month
                                                    .toString()
                                                    .replaceAll('6', 'Junio'),
                                            style: GoogleFonts.bebasNeue(
                                                textStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 110, 110, 110),
                                              fontSize: 8,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.normal,
                                            ))),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      )),
                );
              },
              /* separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1,
                color: Colors.grey,
              );
            },
          )),*/
            )));
  }
}
