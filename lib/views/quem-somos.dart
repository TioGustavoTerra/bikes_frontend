import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:flutter/material.dart';

class QuemSomos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < 800
              ? PreferredSize(
                  child: CabecalhoApp(),
                  preferredSize: const Size(double.infinity, 56),
                )
              : AppBar(),
          drawer: Drawer(),
        );
      },
    );
  }
}
