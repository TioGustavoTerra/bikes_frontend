import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/componentes/destaque.dart';
import 'package:bikes_frontend/componentes/grid_marcas.dart';

import 'package:bikes_frontend/componentes/pesquisa_bar_bikes.dart';
import 'package:bikes_frontend/componentes/top_section.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../componentes/DrawerApp.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    //_requestUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Expanded(
                            child: Column(children: [
                          Stack(
                            children: [
                              const Positioned(child: TopSection()),
                              Positioned(
                                left: MediaQuery.of(context).size.width / 4,
                                top: 300,
                                child: const PesquisaBarBikes()
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 600,
                            width: 600,
                            child: GridMarcas(),
                          ),

                          const SizedBox(
                            height: 800,
                            width: 800,
                            child: Destaque(),
                          )
                        ]))
                      ],
                    ))));
      },
    );
  }

  Future<void> _requestUser() async {
    final user = await SessionManager().get('accessToken');
    if (user == null) {
      setState(() {
        Navigator.pushNamedAndRemoveUntil(
            context, "/login", ModalRoute.withName('/'));
      });
    }
    //nomeUsuario = user['nome_usuario'];
  }
}
