import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class TopsectionSobre extends StatefulWidget {
  const TopsectionSobre({super.key});

  @override
  State<TopsectionSobre> createState() => _TopsectionSobreState();
}

class _TopsectionSobreState extends State<TopsectionSobre> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (Responsive.isDesktop(context)) {
          return AspectRatio(
            aspectRatio: 3.2,
            child: Stack(
              children: [
                Image.asset(
                  'site-sistema/Quem-somos/topo-quem-somos.jpg',
                  fit: BoxFit.cover,
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 270,
                    child: Center(
                      child: Text(
                        'Quem somos',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        if (Responsive.isTablet(context)) {
          return AspectRatio(
            aspectRatio: 3.2,
            child: Stack(
              children: [
                Image.asset(
                  'site-sistema/Quem-somos/topo-quem-somos.jpg',
                  fit: BoxFit.cover,
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 230,
                    child: Center(
                      child: Text(
                        'Quem somos',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
          aspectRatio: 5,
          child: Stack(
            children: [
              Image.asset(
                'site-sistema/Quem-somos/topo-quem-somos.jpg',
                fit: BoxFit.cover,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 144,
                  child: Center(
                    child: Text(
                      'Quem somos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
