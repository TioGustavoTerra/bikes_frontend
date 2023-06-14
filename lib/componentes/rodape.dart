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
        child: Center(
          child: SvgPicture.asset(
            'site-sistema/Menu/Logo-bikes.svg',
          ),
        ),
      ),
    );
  }
}
