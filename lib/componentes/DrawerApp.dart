import 'package:bikes_frontend/features/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  NavigationDrawer();
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Material(
                color: Colors.green.shade700,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => PerfilScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 24 + MediaQuery.of(context).padding.top,
                      bottom: 24,
                    ),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(
                              'assets/site-sistema/Menu/botao-entrar.svg'),
                        ),
                        SizedBox(height: 12),
                        Text('Nome Sobrenome',
                            style:
                                TextStyle(fontSize: 28, color: Colors.white)),
                        Text('nomesobrenome@teste.com',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                child: Wrap(
                  runSpacing: 16,
                  children: [
                    ListTile(
                        leading: const Icon(Icons.home_mini_outlined),
                        title: const Text('Home'),
                        onTap: () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ))),
                    ListTile(
                      leading: const Icon(Icons.face),
                      title: const Text('Conta'),
                      onTap: () {},
                    ),
                    const Divider(color: Colors.black54),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text('Lista de compras'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favoritos'),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
