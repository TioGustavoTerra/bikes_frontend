import 'package:bikes_frontend/features/Teste/teste.dart';
import 'package:bikes_frontend/features/home/home_screen.dart';
import 'package:bikes_frontend/features/about/quem_somos.dart';
import 'package:bikes_frontend/features/register/registration_screen.dart';
import 'package:bikes_frontend/features/login/login_screen.dart';
import 'package:bikes_frontend/features/vender/vender_screen.dart';
import 'package:flutter/material.dart';
import 'features/comprar/comprar_screen.dart';
import 'features/perfil/perfil_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bikes.com.br',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true
      ),
      initialRoute: '/home',
      routes: {
        '/teste':(context) => const Teste(),
        '/perfil': (context) => const PerfilScreen(),
        '/sobre': (context) => QuemSomos(),
        '/login': (context) => LoginPage(),
        '/registro': (context) => Signup(),
        '/home': (context) =>  HomePage(),
        '/vender':(context) => Vender(),
        '/comprar':(context) => Comprar(),
      },
    );
  }
}
