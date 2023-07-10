import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:flutter/material.dart';
import '../componentes/breakpoints.dart';
import '../componentes/cabecalho.dart';

class QuemSomos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < mobileBreakPoint
              ? PreferredSize(
            child: CabecalhoApp(),
            preferredSize: const Size(double.infinity, 56),
          )
              : const PreferredSize(
              child: Cabecalho(), preferredSize: Size(double.infinity, 72)),
          drawer: constraints.maxWidth < mobileBreakPoint ? const Drawer() : null,
        );
      },
    );
  }
}
