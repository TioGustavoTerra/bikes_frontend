import 'package:bikes_frontend/componentes/DrawerApp.dart';
// import 'package:bikes_frontend/componentes/sobre.dart';
import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/componentes/rodape.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/material.dart';

// import '../../componentes/rodape.dart';
// import '../../componentes/rodapeApp.dart';
import '../../componentes/desktopSobre.dart';
import '../../componentes/mobileSobre.dart';
import '../../componentes/rodapeApp.dart';
import '../../componentes/sobre_img.dart';

class QuemSomos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
           return Scaffold(
        appBar: Responsive.isMobile(context)
            ? const PreferredSize(
                preferredSize: Size(double.infinity, 56),
                child: CabecalhoApp(),
              )
            : const PreferredSize(
                preferredSize: Size(double.infinity, 72), child: Cabecalho()),
        drawer: Responsive.isMobile(context)
            ? const Drawer(child: DrawerApp())
            : null,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopsectionSobre(),
               Row(children: [
                   if (Responsive.isMobile(context))
                  const PreferredSize(
                  preferredSize: Size(double.infinity, 56),
                   child: MobileSobre(),
                   )
                   else (const PreferredSize(
                  preferredSize: Size(double.infinity, 72),
                  child: DesktopSobre(),
                )),
               ]),

              if (Responsive.isMobile(context))
                const PreferredSize(
                  preferredSize: Size(double.infinity, 56),
                  child: rodapeApp(),
                )
              else
                (PreferredSize(
                  preferredSize: const Size(double.infinity, 72),
                  child: Rodape(),
                )),
            ],
          ),
        ),
      );
    });
  }
}
