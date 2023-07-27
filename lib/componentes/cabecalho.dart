import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'CabecalhoResponsiveContent.dart';

class Cabecalho extends StatelessWidget {
  const Cabecalho({Key? key}) : super(key: key);

 final searchController = null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      title: Row(children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              print(
                  'biggest ${constraints.biggest} smallest${constraints.smallest}');
              return Container(
                height: 400,
                width: 100,
              );

            },
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/Logo-bikes.svg',
            width: 55,
            height: 55,
          ),
        ),
        const SizedBox(width: 32),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
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

        CabecalhoResponsiveContent(),

        // TextButton(
        //   style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/login');
        //   },
        //   child: const Text(
        //     '| Entrar',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 15,
        //     ),
        //   ),
        // ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              print(
                  'biggest ${constraints.biggest} smallest${constraints.smallest}');

              return Container(
                height: 400,
                width: 100,
              );
            },
          ),
        ),
      ]),
    );
  }
}
