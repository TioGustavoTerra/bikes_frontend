import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Rodape extends StatelessWidget {
  const Rodape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'site-sistema/Menu/Logo-bikes.svg',
            ),
            const SizedBox(width: 10),
            TextButton(
              style: TextButton.styleFrom( textStyle: const TextStyle(fontSize: 0) ),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login');
              },
              child: const Text(
                'Política de troca',
                // padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
                style: TextStyle(
                    color: Color.fromARGB(
                        255, 29, 118, 94),
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 20),),
            ),
            const SizedBox(width: 10),
            TextButton(
              style: TextButton.styleFrom( textStyle: const TextStyle(fontSize: 0) ),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/login');
              },
              child: const Text(
                'Política de privacidade',
                // padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
                style: TextStyle(
                    color: Color.fromARGB(
                        255, 29, 118, 94),
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 20),),
            ),

          ],
        ),
      ),
    );
  }
}
