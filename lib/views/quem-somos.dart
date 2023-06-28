import 'dart:html';

import 'package:flutter/material.dart';

import '../componentes/cabecalho.dart';
import '../componentes/rodapehome.dart';

class Quemsomos extends StatefulWidget {
  const Quemsomos({Key? key}) : super(key: key);

  @override
  _QuemsomosState createState() => _QuemsomosState();
}

class _QuemsomosState extends State<Quemsomos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        title: const Cabecalho(),
        automaticallyImplyLeading: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(height: 50),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(bottom: 800),
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                          color: Colors.orange,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network('assets/site-sistema/Quem-somos/topo-quem-somos.jpg')
                        )),
                          ],
                        ),
                      ),


              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                    height: 350,
                    child: Row(
                      children: [

                        Padding(
                            padding: const EdgeInsets.only(left: 500, top: 200, bottom: 300),

                            child: Column(
                              children: [
                                Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width / 5,
                                     child: const Text('Quem somos\n\n'
                                       'A Bikes.com.br está sendo pensada para se tornar a referência nacional quando se tratar das atividades relacionadas ao ciclismo. Sejam elas, atividades de lazer, competições, organização de eventos, compra e venda de Bikes novas e usadas, acessórios, peças, nutrição e muito mais...\n\n'
                                          'Nos posicionamos como uma Startup ligada ao escossistema tecnológico fomentado no Sudoeste do Paraná, a empresa nasce com o objeito de entregar valor para todos os envolvidos no mundo das Bikes. Nasce do sonhos de seus CoFundadores, Gustavo Eduardo Terra e Eduardo Gaspareto, com o objetivo de criar um negócio sustentável, promissor, socialmente correto mas principalmente fomentar a prática de um esporte fantástico que trás muita possibilidade. Vem com a gente!!! Clique aqui para ser avisado do lançamento.\n\n'
                                          'Deus abençoe!!!', style: TextStyle(color: Colors.black),),
                                    ))
                              ],
                            )
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 200, left: 50, bottom: 300),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 7,
                                  child: Column(
                                    children: [
                                      Image.network('assets/site-sistema/Quem-somos/para-esporte.jpg'),
                                     // const Text('Olá mundo', textAlign: TextAlign.center,)
                                      ]))),

                            const SizedBox(height: 20),

                            Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 7,
                                  child: Image.network('assets/site-sistema/Quem-somos/para-passeio.jpg'),
                                ))
                          ],
                        ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20, top: 200, bottom: 300),

                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 7,
                                  child: Image.network('assets/site-sistema/Quem-somos/para-aventura.jpg', width: 100,),
                            ))
                          ],
                        )
                        ),
                      ],
                    )),
              ),

              const Rodape2(),
            ],
          ),
        ),
      ),
    );
  }
}
