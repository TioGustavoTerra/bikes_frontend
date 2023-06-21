
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cabecalho extends StatefulWidget {
  const Cabecalho({Key? key}) : super(key: key);

  @override
  _CabecalhoState createState() => _CabecalhoState();
}

class _CabecalhoState extends State<Cabecalho> {
  @override
  Widget build(BuildContext context) {
    return Padding( padding: EdgeInsets.only(top: 20), child: Row(
      children: [
        SizedBox(width: 300),
        SvgPicture.asset(
          'site-sistema/Menu/Logo-bikes.svg',
          width: 55,
          height: 55,
        ),
        SizedBox(width: 100),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text(
            'Quem somos',
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
        const SizedBox(width: 40),
        SvgPicture.asset(
          'site-sistema/Menu/botao-carrinho.svg',
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(
          'site-sistema/Menu/botao-lista-de-desejos.svg',
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(
          'site-sistema/Menu/botao-entrar.svg',
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/registration');
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
            Navigator.pushNamed(context, '/registration');
          },
          child: const Text(
            'CRIE SUA CONTA',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(width: 20),
        SvgPicture.asset(
          'site-sistema/Menu/botao-whatsapp.svg',
        ),
        const SizedBox(width: 20),
        SvgPicture.asset(
          'site-sistema/Menu/botao-facebook.svg',
        ),
        const SizedBox(width: 20),
        SvgPicture.asset(
          'site-sistema/Menu/botao-instagram.svg',
        ),
      ],
    ),);
  }
}
