import 'package:bikes_frontend/componentes/button.dart';
import 'package:bikes_frontend/features/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';

class Insta extends StatefulWidget {
  const Insta({Key? key}) : super(key: key);

  @override
  State<Insta> createState() => _InstaState();
}

class _InstaState extends State<Insta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            title: Text(
              'Confira nosso Instagram',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.10,
            children: [
              Card(
                color: Colors.blue[200],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[200],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(),
              ),
              Card(
                color: Colors.blue[400],
                child: Container(
                  child: MyButtonAgree(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/home",
                          ModalRoute.withName('/'),
                        );
                      },
                      text: 'Acesse nosso instagram!'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
