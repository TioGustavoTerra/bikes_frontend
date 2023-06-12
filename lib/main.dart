import 'package:bikes_frontend/testes.dart';
import 'package:bikes_frontend/views/registration_screen.dart';
import 'package:bikes_frontend/views/login_screen.dart';
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
      // home: Signup(),
      home: LoginPage(),
    );
  }
}