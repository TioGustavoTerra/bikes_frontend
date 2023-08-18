import 'package:flutter/material.dart';

class Speed extends StatefulWidget {
  const Speed({super.key});

  @override
  State<Speed> createState() => _SpeedState();
}

class _SpeedState extends State<Speed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar(
        centerTitle: true,
        title: Text(
          'Seleção Speed',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      SliverGrid.count(
        crossAxisCount: 4,
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
