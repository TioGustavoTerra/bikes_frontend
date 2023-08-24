import 'package:bikes_frontend/componentes/DrawerApp.dart';
// import 'package:bikes_frontend/componentes/sobre.dart';
import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/componentes/rodape.dart';
import 'package:bikes_frontend/componentes/tabletSobre.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

// import '../../componentes/rodape.dart';
// import '../../componentes/rodapeApp.dart';
import '../../componentes/mobileSobre.dart';
import '../../componentes/rodapeApp.dart';
import '../../componentes/sobre_img.dart';

class QuemSomos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: Responsive.isMobile(context)
            ? const PreferredSize(
                preferredSize: Size(double.infinity, 56),
                child: CabecalhoApp(),
              )
            : const PreferredSize(
                preferredSize: Size(double.infinity, 72), child: Cabecalho()),
        drawer: Responsive.isMobile(context)
            ? const Drawer(child: DrawerApp())
            : null,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopsectionSobre(),
              if (Responsive.isDesktop(context))
                Row(children: [
                  Column(children: [
                    const Text(
                      'QUEM SOMOS?',
                      style: TextStyle(
                        fontSize: 22.4,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    RichText(
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
                        style: const TextStyle(fontSize: 19),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                ' Clique aqui para ser \navisado do lançamento\n\n',
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
                  ]),
                  Row(children: [
                    Column(
                      children: [
                        Image.asset(
                          'site-sistema/Quem-somos/para-esporte.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'site-sistema/Quem-somos/para-passeio.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Image.asset(
                      'site-sistema/Quem-somos/para-aventura.jpg',
                      fit: BoxFit.cover,
                    ),
                  ]),
                ]),
              if (Responsive.isMobile(context))
                const PreferredSize(
                  preferredSize: Size(double.infinity, 56),
                  child: MobileSobre(),
                ),
              if (Responsive.isTablet(context))
                const PreferredSize(
                  preferredSize: Size(double.infinity, 72),
                  child: TabletSobre(),
                ),
              if (Responsive.isMobile(context))
                const PreferredSize(
                  preferredSize: Size(double.infinity, 56),
                  child: rodapeApp(),
                )
              else
                (PreferredSize(
                  preferredSize: const Size(double.infinity, 72),
                  child: Rodape(),
                )),
            ],
          ),
        ),
      );
    });
  }
}
