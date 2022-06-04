import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_futbol/pages/open.dart';
import 'package:proyecto_futbol/pages/login.dart';
import 'package:proyecto_futbol/routes/MovPages.dart';
import 'package:proyecto_futbol/services/football_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Usuario();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futbol Api',
      home: Usuario(),
      //routes: MovPage.route,
    );
  }
}
