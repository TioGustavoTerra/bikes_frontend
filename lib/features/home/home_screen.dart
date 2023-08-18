import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/componentes/destaque.dart';
import 'package:bikes_frontend/componentes/grid_marcas.dart';
import 'package:bikes_frontend/componentes/pesquisa_bar_bikes.dart';
import 'package:bikes_frontend/componentes/rodape.dart';
import 'package:bikes_frontend/componentes/home_img.dart';
import 'package:bikes_frontend/componentes/selecionamos.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../componentes/DrawerApp.dart';
import '../../componentes/insta.dart';
import '../../componentes/qual_estilo.dart';
import '../../componentes/rodapeApp.dart';
import '../../componentes/speed.dart';

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
                          Center(
                            child: Stack(
                              children: [
                                const TopsectionHome(),
                                Positioned(
                                    right: (MediaQuery.of(context).size.width -
                                            550) /
                                        2,
                                    bottom: 0,
                                    child: const PesquisaBarBikes()),
                              ],
                            ),
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
                          ),
                          
                         const SizedBox(
                            height: 800,
                            width: 800,
                          child: QualoEstilo(),
                        ),

                        const SizedBox(
                          height: 800,
                          width: 800,
                          child: Selecionamos(),
                        ),

                        const SizedBox(
                          height: 800,
                          width: 800,
                          child: Speed(),
                        ),

                        const SizedBox(
                          height: 800,
                          width: 800,
                          child: Insta(),
                        ),

                       if (Responsive.isMobile(context))
                 const PreferredSize(
                    preferredSize: Size(double.infinity, 56),
                    child: rodapeApp(),
                  )
                    else( PreferredSize(
                    preferredSize: const Size(double.infinity, 72),
                    child: Rodape(),
                  )),

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
