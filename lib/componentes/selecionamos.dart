import 'package:flutter/material.dart';

class Selecionamos extends StatefulWidget {
  const Selecionamos({super.key});

  @override
  State<Selecionamos> createState() => _SelecionamosState();
}

class _SelecionamosState extends State<Selecionamos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar(
        centerTitle: true,
        title: Text(
          'Olha o que selecionamos para você',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.10,
        children: [
          Card(
            color: Colors.blue[200],
            child: Container(),
          ),
          Card(
            color: Colors.blue[400],
            child: Container(),
          ),
          Card(
            color: Colors.blue[200],
            child: Container(),
          ),
          Card(
            color: Colors.blue[400],
            child: Container(),
          ),
        ],
      ),
    ]));
  }
}
