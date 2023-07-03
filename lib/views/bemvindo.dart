import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../componentes/rodapehome.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   SessionManager.get("")
  // }
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
              : const PreferredSize(
              child: Cabecalho(), preferredSize: Size(double.infinity, 72)),
          drawer: const Drawer(
            child: Text('Tirar dps'),
          ),
        );
      },
    );
  }
}

