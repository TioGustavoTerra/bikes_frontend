import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        if (Responsive.isDesktop(context)) {
          return AspectRatio(
            aspectRatio: 3.2,
            child: Stack(
              children: [
                Image.asset(
                  'site-sistema/Home/foto-hero-topo.jpg',
                  fit: BoxFit.cover,
                ),
               const Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 270,
                      child:  Center(
                        child: Text(
                          'Seu principal marketplace de bikes',
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

        if(Responsive.isTablet(context)) {
            return AspectRatio(
              aspectRatio: 3.2,
              child: Stack(
                children: [
                   Image.asset(
                  'site-sistema/Home/foto-hero-topo.jpg',
                  fit: BoxFit.cover,
                ),
                 const Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 230,
                        child: Center(
                          child: Text(
                            'Seu principal marketplace de bikes',
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
          aspectRatio: 3.2,
          child: Stack(
            children: [
               Image.asset(
                  'site-sistema/Home/foto-hero-topo.jpg',
                  fit: BoxFit.cover,
                ),
             const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 144,
                    child: Center(
                      child: Text(
                        'Seu principal marketplace de bikes',
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