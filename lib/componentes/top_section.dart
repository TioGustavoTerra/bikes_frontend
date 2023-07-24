import 'package:bikes_frontend/componentes/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        if (maxWidth >= 1200) {
          return AspectRatio(
            aspectRatio: 3.2,
            child: Stack(
              children: [
                Image.network(
                  'assets/site-sistema/Quem-somos/topo-quem-somos.jpg',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 270,
                    child: Container(
                      color: const Color.fromARGB(150, 9, 188, 138),
                      child: const Center(
                        child: Text(
                          'Quem Somos',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if(maxWidth >= mobileBreakPoint) {
            return AspectRatio(
              aspectRatio: 3.2,
              child: Stack(
                children: [
                  Image.network(
                    'assets/site-sistema/Quem-somos/topo-quem-somos.jpg',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 230,
                      child: Container(
                        color: const Color.fromARGB(150, 9, 188, 138),
                        child: const Center(
                          child: Text(
                            'Quem Somos',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
        }

      return AspectRatio(
          aspectRatio: 3.2,
          child: Stack(
            children: [
              Image.network(
                'assets/site-sistema/Quem-somos/topo-quem-somos.jpg',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 144,
                  child: Container(
                    color: const Color.fromARGB(150, 9, 188, 138),
                    child: const Center(
                      child: Text(
                        'Quem Somos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}