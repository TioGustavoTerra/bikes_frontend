import 'package:flutter/material.dart';

class AboutResponsiveApp extends StatelessWidget {
  const AboutResponsiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
