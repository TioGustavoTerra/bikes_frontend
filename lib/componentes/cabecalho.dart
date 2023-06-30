
import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cabecalho extends StatefulWidget {
  const Cabecalho({Key? key}) : super(key: key);

  @override
  _CabecalhoState createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding( padding: const EdgeInsets.only(top: 20), child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(240,248,255,100),
                Color.fromRGBO(240,248,255,100),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
       const SizedBox(width: 250),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        child: SvgPicture.asset(
          'site-sistema/Menu/Logo-bikes.svg',
          width: 60,
          height: 60,
        ),
    ),
        const SizedBox(width: 100),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
          child: const Text(
            'Sobre',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Comprar',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Vender',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Contato',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),

        const SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/botao-carrinho.svg',
          ),
        ),

        const SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/botao-lista-de-desejos.svg',
          ),
        ),

        const SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/botao-entrar.svg',
          ),
        ),


        const SizedBox(width: 10),

        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            '| Entrar',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/botao-whatsapp.svg',
          ),
        ),

        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/botao-facebook.svg',
          ),
        ),

        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/botao-instagram.svg',
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hintText: 'Pesquisar',
                    controller: searchController,
                    obscureText: false,
                    inputFormatter: const [],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Lógica para realizar a pesquisa
                  },
                ),
              ],
            ),
          ),
        )
      ],
    ),);
  }
}
