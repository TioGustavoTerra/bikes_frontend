import 'package:bikes_frontend/componentes/about_responsive_app.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:flutter/material.dart';
import '../componentes/about_responsive_web.dart';
import '../componentes/breakpoints.dart';
import '../componentes/cabecalho.dart';
import '../componentes/top_section.dart';

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
                    child: Cabecalho(),
                    preferredSize: Size(double.infinity, 72)),

          drawer: constraints.maxWidth <= 900
              ? const Drawer(
              child: Column(
              children: [
                ListTile(
                  title: Text("teste"),
                ),
                ListTile(
                  title: Text("teste"),
                ),
              ],
            ),
          ) : null,

        );
      },
    );
  }
}
