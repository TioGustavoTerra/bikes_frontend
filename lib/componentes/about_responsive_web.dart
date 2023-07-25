import 'package:flutter/material.dart';

class AboutResponsiveWeb extends StatelessWidget {
  const AboutResponsiveWeb({Key? key}) : super(key: key);

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

