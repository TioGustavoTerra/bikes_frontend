import 'package:flutter/material.dart';

class CabecalhoResponsiveContent extends StatelessWidget {
  const CabecalhoResponsiveContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: LayoutBuilder(
          builder: (context, constraints) {
            print('biggest ${constraints.biggest} smallest${constraints.smallest}');

            return Container(
              height: 400,
              width: 200,
            );
          },
        ),
    );
  }
}
