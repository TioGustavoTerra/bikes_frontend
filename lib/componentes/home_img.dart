import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopsectionHome extends StatelessWidget {
  const TopsectionHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // if (Responsive.isDesktop(context)) {
          return Expanded(
            child: Stack(
              children: [
                Container(
                  height: 250,
                  color: const Color.fromARGB(255, 8, 188, 138),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 200,
                    child: Container(
                        child:  DefaultTextStyle(
                        style: GoogleFonts.montserrat(                   
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('Bikes é EQUILÍBRIO!'),
                            RotateAnimatedText('Bikes é SAÚDE!'),
                            RotateAnimatedText('Bikes é FELICIDADE!'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    )
                  ),
                ),
              ],
            ),
          );
      //   }

      //   if (Responsive.isTablet(context)) {
      //     return AspectRatio(
      //       aspectRatio: 3.2,
      //       child: Stack(
      //         children: [
      //           Image.asset(
      //             'site-sistema/Home/foto-hero-topo.jpg',
      //             fit: BoxFit.cover,
      //           ),
      //           const Align(
      //             alignment: Alignment.topCenter,
      //             child: SizedBox(
      //               height: 230,
      //               child: Center(
      //                 child: Text(
      //                   'Seu principal marketplace de bikes',
      //                   style: TextStyle(
      //                     fontSize: 32,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     );
      //   }

      //   return AspectRatio(
      //     aspectRatio: 3.2,
      //     child: Stack(
      //       children: [
      //         Image.asset(
      //           'site-sistema/Home/foto-hero-topo.jpg',
      //           fit: BoxFit.cover,
      //         ),
      //         const Align(
      //           alignment: Alignment.topCenter,
      //           child: SizedBox(
      //             height: 144,
      //             child: Center(
      //               child: Text(
      //                 'Seu principal marketplace de bikes',
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   );
      },
    );
  }
}
