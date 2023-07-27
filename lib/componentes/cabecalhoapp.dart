import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CabecalhoApp extends StatelessWidget {
  const CabecalhoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
     automaticallyImplyLeading: false,
      title: TextButton(
        style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: SvgPicture.asset(
          'site-sistema/Menu/Logo-bikes.svg',
          width: 45,
          height: 45,
        ),
      ),
      centerTitle:  true,
    );
  }
}

