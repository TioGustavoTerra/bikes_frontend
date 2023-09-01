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
  Widget build(BuildContext context) => Drawer(backgroundColor:const Color.fromARGB(255, 9, 188, 138),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Material(
                color: const Color.fromARGB(255, 9, 188, 138),
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
                        // Icon(Icons., color: Colors.black,),
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
                color: const Color.fromARGB(255, 9, 188, 138),
                padding: const EdgeInsets.all(24),
                child: Wrap(
                  runSpacing: 16,
                  children: [
                    ListTile(
                        leading: const Icon(Icons.home, color: Colors.white,),
                        title: const Text('Home', style: TextStyle(color: Colors.white),),
                        onTap: () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ))),
                    ListTile(
                      leading: const Icon(Icons.face, color: Colors.white,),
                      title: const Text('Conta', style: TextStyle(color: Colors.white),),
                      onTap: () {
                     Navigator.pushNamedAndRemoveUntil(context, "/perfil", ModalRoute.withName('/perfil'),);
                      },
                  
                    ),
                    const Divider(color: Colors.black54),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart, color: Colors.white,),
                      title: const Text('Lista de compras', style: TextStyle(color: Colors.white),),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.white,),
                      title: const Text('Favoritos', style: TextStyle(color: Colors.white),),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.face, color: Colors.white,),
                      title: const Text('Sobre', style: TextStyle(color: Colors.white),),
                      onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/sobre", ModalRoute.withName('/sobre'),);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.sell, color: Colors.white,),
                      title: const Text('Comprar', style: TextStyle(color: Colors.white),),
                      onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/comprar", ModalRoute.withName('/comprar'),);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.sell, color: Colors.white,),
                      title: const Text('Vender', style: TextStyle(color: Colors.white),),
                      onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/vender", ModalRoute.withName('/vender'),);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.white,),
                      title: const Text('Contato', style: TextStyle(color: Colors.white),),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.search, color: Colors.white,),
                      title: const Text('Pesquisar', style: TextStyle(color: Colors.white),),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout, color: Colors.white,),
                      title: const Text('Sair', style: TextStyle(color: Colors.white),),
                      onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/registro", ModalRoute.withName('/registro'),);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
