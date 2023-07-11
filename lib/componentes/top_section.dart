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
                      color: const Color.fromRGBO(9, 149, 85, 100),
                      child: const Center(
                        child: Text(
                          'Quem Somos',
                          style: TextStyle(
                            fontSize: 40,
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
        return Container();
      },
    );
  }
}