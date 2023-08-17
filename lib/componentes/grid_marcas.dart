import 'package:flutter/material.dart';

class GridMarcas extends StatefulWidget {
  const GridMarcas({Key? key}) : super(key: key);

  @override
  _GridMarcasState createState() => _GridMarcasState();
}

class _GridMarcasState extends State<GridMarcas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
     const SliverAppBar(
      
              centerTitle: true,
              title: Text(
                'Escolha por marca',
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
  ]
  )
    );
  }
}
