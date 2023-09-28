import 'package:bikes_frontend/componentes/button.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Insta extends StatefulWidget {
  const Insta({Key? key}) : super(key: key);

  @override
  State<Insta> createState() => _InstaState();
}

class _InstaState extends State<Insta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                centerTitle: true,
                title: Text(
                  'Confira nosso Instagram',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
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
                ],
              ),
            ],
          ),
        ),
        
        SizedBox(
          width: 200,
          child: MyButtonAgree(
            text: "Siga-nos agora",
            image: "site-sistema/Home/insta.svg",
            onTap: () async {
             const instagramUrl = 'https://www.instagram.com/bikescombr/';

              if (await canLaunchUrlString(instagramUrl)) {
                await launchUrlString(instagramUrl);
              } else {
                throw 'Não foi possível abrir o link do Instagram';
              }
            },
          ),
        ),

        const SizedBox( height: 140,)

      ]),
    );
  }
}
