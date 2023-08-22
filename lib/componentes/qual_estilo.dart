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
      body: CustomScrollView(slivers: [
     const SliverAppBar(
      
              centerTitle: true,
              title: Text(
                'Qual o seu \n ESTILO?',
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
    ])
    );
  }
}
