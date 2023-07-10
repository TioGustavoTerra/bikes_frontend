import 'package:bikes_frontend/componentes/breakpoints.dart';
import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:flutter/material.dart';

import '../componentes/rodapeApp.dart';

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
          appBar: constraints.maxWidth < mobileBreakPoint
              ? PreferredSize(
            child: CabecalhoApp(),
            preferredSize: const Size(double.infinity, 56),
          )
              : const PreferredSize(
              child: Cabecalho(), preferredSize: Size(double.infinity, 72)),

          drawer: constraints.maxWidth < mobileBreakPoint ? const Drawer(child: Column(
            children: [
             // ListTile(
             //   title: Text("teste"),
             //   onTap: ()=>{
             //     Na
             //   },
             // ),
              ListTile(
                title: Text("teste"),
              ),
              ListTile(
                title: Text("teste"),
              )
            ],
          ),) : null,
          body: Align(
            alignment: Alignment.bottomCenter,
         child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Container(
              height: 1000,
              color: Colors.red,
            ),
          ),
          )
        );
      },
        );
  }
}

