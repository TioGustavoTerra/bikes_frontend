import 'package:flutter/material.dart';

class GridMarcas extends StatefulWidget {
  const GridMarcas({super.key});

  @override
  State<GridMarcas> createState() => _GridMarcasState();
}

class _GridMarcasState extends State<GridMarcas> {
  final List<String> items = List.generate(6, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 3,
            child: SliverList(
              delegate: SliverChildDelegate([ crossAxisCount: 3,
                List.generate(6, (index) {
                return const Card(
                  color: Colors.blue,
                );]),
             
              )));
              }
}
