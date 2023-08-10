import 'package:bikes_frontend/componentes/DrawerApp.dart';
import 'package:bikes_frontend/componentes/about_responsive_web.dart';
import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/material.dart';

class QuemSomos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: Responsive.isMobile(context)
                ? const PreferredSize(
                    child: CabecalhoApp(),
                    preferredSize: Size(double.infinity, 56),
                  )
                : const PreferredSize(
                    child: Cabecalho(),
                    preferredSize: Size(double.infinity, 72)),
            drawer: Responsive.isMobile(context)
                ? const Drawer(child: DrawerApp())
                : null,
                body: AboutResponsiveWeb(),
                );
      },
    );
  }
}
