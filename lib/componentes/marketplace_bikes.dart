import 'package:bikes_frontend/componentes/top_section.dart';
import 'package:flutter/material.dart';

class MarketplaceBikes extends StatefulWidget {
  const MarketplaceBikes({Key? key}) : super(key: key);

  @override
  _MarketplaceBikesState createState() => _MarketplaceBikesState();
}

class _MarketplaceBikesState extends State<MarketplaceBikes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      // SliverGrid #1
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
          Card(
            color: Colors.blue[600],
            child: Container(),
          ),
          Card(
            color: Colors.blue[100],
            child: Container(),
          ),
          Card(
            color: Colors.blue[100],
            child: Container(),
          ),
          Card(
            color: Colors.blue[100],
            child: Container(),
          ),
        ],
      ),
    ]));
  }
}
