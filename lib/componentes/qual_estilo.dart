import 'package:flutter/material.dart';

class QualoEstilo extends StatefulWidget {
  const QualoEstilo({super.key});

  @override
  State<QualoEstilo> createState() => _QualoEstiloState();
}

class _QualoEstiloState extends State<QualoEstilo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: const Color.fromARGB(255, 9, 188, 138),
            child: const Text(
              'Qual o seu \n ESTILO?',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Column(
            children: [
              Card(
                color: const Color.fromARGB(255, 0, 140, 255),
                child: Container(),
              ),
              Card(
                color: const Color.fromARGB(255, 0, 140, 255),
                child: Container(),
              ),
              Card(
                color: const Color.fromARGB(255, 0, 140, 255),
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
