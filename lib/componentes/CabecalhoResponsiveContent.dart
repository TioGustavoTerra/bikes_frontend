import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bikes_frontend/features/perfil/perfil_screen.dart';

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
              if(constraints.maxWidth >= 150)
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
                    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
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


              if(constraints.maxWidth >= 300)

                TextButton(
                  style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                  onPressed: () {
             Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName('/'),);
                  },
                  child:SvgPicture.asset(
                    'site-sistema/Menu/botao-carrinho.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
              if(constraints.maxWidth >= 300)
              TextButton(
                style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                onPressed: () {
             Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName('/'),);
                },
                child: SvgPicture.asset(
                  'site-sistema/Menu/botao-lista-de-desejos.svg',
                  width: 40,
                  height: 40,
                ),
              ),
              if(constraints.maxWidth >= 300)
              TextButton(
                style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 0)),
                onPressed: () {
             Navigator.pushNamedAndRemoveUntil(context, "/perfil", ModalRoute.withName('/perfil'),);
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
