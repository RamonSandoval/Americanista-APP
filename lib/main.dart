import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_futbol/pages/open.dart';
import 'package:proyecto_futbol/routes/MovPages.dart';
import 'package:proyecto_futbol/services/ptrophy_service.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FootBallServices(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futbol Api',
      home: OpenMain(),
      routes: MovPage.route,
    );
  }
}
