import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CabecalhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
      children: [
        const SizedBox(width: 175),
        TextButton(
          style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: SvgPicture.asset(
            'site-sistema/Menu/Logo-bikes.svg',
            width: 50,
            height: 50,
          ),
        ),
      ],
    ),
    centerTitle:  true,
    );
  }
}

