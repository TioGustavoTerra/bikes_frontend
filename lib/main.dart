import 'package:bikes_frontend/features/home/home_screen.dart';
import 'package:bikes_frontend/features/about/quem-somos.dart';
import 'package:bikes_frontend/features/register/registration_screen.dart';
import 'package:bikes_frontend/features/login/login_screen.dart';
import 'package:flutter/material.dart';

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
        '/about': (context) => QuemSomos(),
        '/login': (context) => LoginPage(),
        '/register': (context) => Signup(),
        '/home': (context) =>  HomePage(),
      },
    );
  }
}
