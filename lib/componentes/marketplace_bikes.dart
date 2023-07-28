import 'package:bikes_frontend/componentes/top_section.dart';
import 'package:flutter/material.dart';

class MarketplaceBikes extends StatelessWidget {
  const MarketplaceBikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1300),
            child: ListView(
              children: const [
                TopSection(),
              ],
            ),
           )
         );
  }
}
