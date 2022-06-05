import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          title: const Text(
            'NOTICIAS',
            style: TextStyle(fontSize: 23),
          ),
          backgroundColor: Color(0xFF10203c),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: ListView.builder(
              itemCount: footballDataService.articles.length,
              itemBuilder: (
                context,
                index,
              ) {
                var autor = footballDataService.articles[index].author;
                var titulo = footballDataService.articles[index].title;
                var imagen =
                    'https://i.ytimg.com/vi/glZ6_ii3who/maxresdefault.jpg';
                var linkNoticia = footballDataService.articles[index].url;
                var fecha = footballDataService.articles[index].publishedAt;

                var date = fecha;
                var newDate = new DateTime(date.day, date.month);

                if (autor == null) {
                  return Text('Desconocido');
                }

                return Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8,
                              child: ListTile(
                                onLongPress: () async {
                                  // ignore: deprecated_member_use
                                  if (await canLaunch(linkNoticia)) {
                                    await launch(linkNoticia,
                                        forceWebView: false);
                                  }
                                },
                                title: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    titulo,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.bebasNeue(
                                        textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    )),
                                  ),
                                ),
                                horizontalTitleGap: 13,
                                subtitle: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(autor,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 138, 138, 138),
                                                fontSize: 12)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(date.day.toString() +
                                            " de " +
                                            date.month
                                                .toString()
                                                .replaceAll('6', 'Junio'))
                                      ],
                                    )
                                  ],
                                ),
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: NetworkImage(imagen),
                                      fit: BoxFit.cover,
                                    )),
                                /*trailing: Container(
                                  child: Text(''),
                                ),*/
                              )),
                        ),
                      ]),
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
