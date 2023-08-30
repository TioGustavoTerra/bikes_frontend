import 'package:flutter/material.dart';

import '../../componentes/DrawerApp.dart';
import '../../componentes/cabecalho.dart';
import '../../componentes/cabecalhoapp.dart';
import '../../componentes/home_img.dart';
import '../../componentes/pesquisa_bar_bikes.dart';
import '../../componentes/rodape.dart';
import '../../componentes/rodapeApp.dart';
import '../../utils/responsive.dart';

class Comprar extends StatefulWidget {
  const Comprar({super.key});

  @override
  State<Comprar> createState() => _ComprarState();
}

class _ComprarState extends State<Comprar> {
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
                  preferredSize: Size(double.infinity, 72),
                  child: Cabecalho(),
                ),
          drawer: Responsive.isMobile(context)
              ? const Drawer(child: DrawerApp())
              : null,
          body: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: ListView(shrinkWrap: true, children: [
                    Expanded(
                        child: Column(children: [
                      Center(
                        child: Stack(
                          children: [
                            const TopsectionHome(),
                            Positioned(
                                right:
                                    (MediaQuery.of(context).size.width - 550) /
                                        2,
                                bottom: 0,
                                child: const PesquisaBarBikes()),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Resultado da busca',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 1500,
                          width: 1500,
                          child: Scaffold(
                              body: CustomScrollView(
                            slivers: [
                              SliverGrid.count(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 1,
                                children: [
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                  Card(
                                    color: Colors.blue,
                                    child: Container(),
                                  ),
                                ],
                              ),
                            ],
                          ))),
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
                    ]))
                  ]))));
    });
  }
}
