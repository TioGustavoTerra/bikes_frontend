import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RodapeApp extends StatelessWidget {
  const RodapeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          
           SvgPicture.asset(
          'site-sistema/Menu/Logo-bikes.svg',
          width: 60,
          height: 60,
        ),
       const Text(
                'Destaques da semana',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
