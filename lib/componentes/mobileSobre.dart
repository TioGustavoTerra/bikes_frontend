import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MobileSobre extends StatefulWidget {
  const MobileSobre({super.key});

  @override
  State<MobileSobre> createState() => _MobileSobreState();
}

class _MobileSobreState extends State<MobileSobre> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Column(children: [
          const Text(
            'QUEM SOMOS?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: RichText(
              text: TextSpan(
                text:
                    'A Bikes.com.br está sendo pensada para se tornar a referência\n'
                    'nacional quando se tratar des atividades relacionadas ao ciclismo.\n'
                    'Sejam elas, atividades de lazer, competições, organização\n'
                    'de eventos, compra e vende de Bikes novas ou usadas, acessórios,\n'
                    'peças, nutrição e muito mais...\n\n'
                    'Nos posicionamos como uma Startup ligada ao ecossistema\n'
                    'tecnológico fomentado no Sudoeste do Paraná, a empresa nasce\n'
                    'com o objetivo de entregar valor para todos os envolvidos no mundo\n'
                    'das Bikes. Nasce dos sonhos de seus CoFundadores, Gustavo\n'
                    'Eduardo Terra e Eduardo Gaspareto, com o objetivo de criar um\n'
                    'negócio sustentável, promissor, socialmente correto mas\n'
                    'principalmente fomentar a prática de um esporte fantástco que trás\n'
                    'muita possibilidade. Vem com a gente!!!',
                style: const TextStyle(fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Clique aqui para ser \navisado do lançamento\n\n',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "/home",
                          ModalRoute.withName('/'),
                        );
                      },
                  ),
                  const TextSpan(text: 'Deus abençoe!!!'),
                ],
              ),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child:
                Image.asset(
                  'site-sistema/Quem-somos/para-esporte.jpg',
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
            ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'site-sistema/Quem-somos/para-passeio.jpg',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                )
              ],
            ),
            Image.asset(
              'site-sistema/Quem-somos/para-aventura.jpg',
              fit: BoxFit.cover,
              width: 130,
            ),
          ]),
        )
      ]),
    );
  }
}
