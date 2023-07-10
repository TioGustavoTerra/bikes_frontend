import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CabecalhoResponsiveContent extends StatelessWidget {
  const CabecalhoResponsiveContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          print(
              'biggest ${constraints.biggest} smallest${constraints.smallest}');

          return Row(
            children: [
              Expanded(
                  child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 4),
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pesquisar',
                          isCollapsed: true,
                        ),
                      ),
                    )
                  ],
                ),
              )),
              if(constraints.maxWidth >= 400)
                TextButton(
                  style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: SvgPicture.asset(
                    'site-sistema/Menu/botao-carrinho.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
              if(constraints.maxWidth >= 500)
              TextButton(
                style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: SvgPicture.asset(
                  'site-sistema/Menu/botao-lista-de-desejos.svg',
                  width: 40,
                  height: 40,
                ),
              ),
              if(constraints.maxWidth >= 600)
              TextButton(
                style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: SvgPicture.asset(
                  'site-sistema/Menu/botao-entrar.svg',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
