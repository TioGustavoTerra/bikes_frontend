import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'CabecalhoResponsiveContent.dart';

class Cabecalho extends StatelessWidget {
  const Cabecalho({Key? key}) : super(key: key);

  final searchController = null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      elevation: 8,
      shadowColor: Colors.black,
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
             Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName('/'),);
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/Logo-bikes.svg',
            width: 55,
            height: 55,
          ),
        ),
        const SizedBox(width: 50),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/sobre",
              ModalRoute.withName('/sobre'),
            );
          },
          child: const Text(
            'Sobre',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 50),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
             Navigator.pushNamedAndRemoveUntil(context, "/comprar", ModalRoute.withName('/comprar'),);
          },
          child: const Text(
            'Comprar',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 50),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
                     Navigator.pushNamedAndRemoveUntil(context, "/vender", ModalRoute.withName('/vender'),);
          },
          child: const Text(
            'Vender',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 50),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
                         Navigator.pushNamedAndRemoveUntil(context, "/contato", ModalRoute.withName('/contato'),);
          },
          child: const Text(
            'Contato',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
const SizedBox(width: 50),
      const  CabecalhoResponsiveContent(),

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
