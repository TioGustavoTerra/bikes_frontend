import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class cabecalho extends StatelessWidget {
  const cabecalho({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'assets/site-sistema/cadastro/fundo-cadastro.jpg',
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 40,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 40,
                fit: BoxFit.cover,
              ),
              Container(
                color: const Color.fromRGBO(30, 122, 97, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
