import 'package:bikes_frontend/componentes/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CabecalhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextButton(
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
      centerTitle:  true,
    actions: [
      IconButton(icon: Icon(Icons.search), onPressed: () {},),
      IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {},),
    ],
    );
  }
}

