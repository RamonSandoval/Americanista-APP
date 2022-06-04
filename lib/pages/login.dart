// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_futbol/pages/Alineacion.dart';
import 'package:proyecto_futbol/pages/open.dart';
import 'package:proyecto_futbol/pages/perfil.dart';
import 'package:proyecto_futbol/pages/players.dart';
import 'package:proyecto_futbol/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class Usuario extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];

  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  //Login
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    //controller textfield
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFeeea9e),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80, left: 25, right: 25),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      width: 200,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/img/logo_ame.png')),
                  Text(
                    'AMERICANISTA',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                          color: Color(0xFF192441),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Iniciar Sesion',
                    style: GoogleFonts.bebasNeue(
                        textStyle: TextStyle(
                      color: Color(0xFF192441),
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    )),
                  ),
                  SizedBox(height: 40),
                  Card(
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Correo electronico",
                          hintStyle: TextStyle(fontSize: 15),
                          prefixIcon: Icon(
                            Icons.mail_outline_outlined,
                            color: Color(0xFF192441),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Contraseña",
                          hintStyle: TextStyle(fontSize: 15),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Color(0xFF192441),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Olvidé mi contraseña',
                    style: TextStyle(
                        color: Color(0xFF192441),
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: Color(0xFF192441),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 0.0,
                      onPressed: () async {
                        User? user = await loginUsingEmailPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                            context: context);
                        print(user);
                        if (user != null) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => OpenMain()));
                        }
                      },
                      child: Text(
                        "Iniciar Sesion",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
