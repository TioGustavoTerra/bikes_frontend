// import 'dart:ui';

// import 'package:bikes_frontend/componentes/destaque.dart';
// import 'package:bikes_frontend/componentes/qual_estilo.dart';
// import 'package:bikes_frontend/componentes/rodape.dart';
// import 'package:bikes_frontend/componentes/rodapeApp.dart';
// import 'package:bikes_frontend/componentes/grid_marcas.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import '../../componentes/button.dart';
// import '../../componentes/square_title.dart';
// import '../../componentes/textfield.dart';
// import '../../utils/responsive.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  
  get passwordController => null;
  
  get emailController => null;

  @override
  Widget build(BuildContext context) {
    return RichText(
            text: TextSpan(
              text: 'Quem somos \n'
                    'A Bikes.com.br está sendo pensada para se tornar a referência\n'
                    'nacional quando se tratar des atividades relacionadas ao ciclismo.\n'
                    'Sejam elas, atividades de lazer, competições, organização de eventos,\n'
                    'compra e vende de Bikes novas ou usadas, acessórios, peças, nutrição e muito mais...\n\n'
                    'Nos posicionamos como uma Startup ligada ao ecossistema\n'
                    'tecnológico fomentado no Sudoeste do Paraná, a empresa nasce\n'
                    'com o objetivo de entregar valor para todos os envolvidos no mundo\n'
                    'das Bikes. Nasce dos sonhos de seus CoFundadores, Gustavo\n'
                    'Eduardo Terra e Eduardo Gaspareto, com o objetivo de criar um\n'
                    'negócio sustentável, promissor, socialmente correto mas\n'
                    'principalmente fomentar a prática de um esporte fantástco que trás\n'
                    'muita possibilidade. Vem com a gente!!!',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'Clique aqui para ser \n avisado do lançamento\n\n',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Abra o link aqui
                    },
                ),
                const TextSpan(text: 'Deus abençoes!!!'),
              ],
            ),
          );
  }
}