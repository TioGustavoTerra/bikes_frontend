import 'package:flutter/material.dart';

class Destaque extends StatefulWidget {
  const Destaque({super.key});

  @override
  State<Destaque> createState() => _DestaqueState();
}

class _DestaqueState extends State<Destaque> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      // SliverGrid #1
     const SliverAppBar(
              centerTitle: true,
              title: Text(
                'Destaques da semana',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
        

      SliverGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1,
        children: [
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