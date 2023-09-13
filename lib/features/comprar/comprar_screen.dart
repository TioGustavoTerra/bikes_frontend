import 'package:bikes_frontend/componentes/button.dart';
import 'package:bikes_frontend/models/ads.dart';
import 'package:bikes_frontend/services/ads_service.dart';
import 'package:flutter/material.dart';

import '../../componentes/DrawerApp.dart';
import '../../componentes/cabecalho.dart';
import '../../componentes/cabecalhoapp.dart';
import '../../componentes/home_img.dart';
import '../../componentes/pesquisa_bar_bikes.dart';
import '../../componentes/rodape.dart';
import '../../componentes/rodapeApp.dart';
import '../../utils/responsive.dart';
import '../home/home_screen.dart';

class Comprar extends StatefulWidget {
  const Comprar({super.key});

  @override
  State<Comprar> createState() => _ComprarState();
}

class _ComprarState extends State<Comprar> {
  final AdsService _adsService = AdsService();
  late List<Ads> adsList = [];

  @override
  void initState() {
    // TODO: implement initState
    getDados();
    super.initState();
  }

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
                  preferredSize: Size(double.infinity, 72),
                  child: Cabecalho(),
                ),
          drawer: Responsive.isMobile(context)
              ? const Drawer(child: DrawerApp())
              : null,
          body: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: ListView(shrinkWrap: true, children: [
                    Expanded(
                        child: Column(children: [
                      Center(
                        child: Stack(
                          children: [
                            const TopsectionHome(),
                            Positioned(
                                right:
                                    (MediaQuery.of(context).size.width - 550) /
                                        2,
                                bottom: 0,
                                child: const PesquisaBarBikes()),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Resultado da busca',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 1500,
                          width: 1500,
                          child: Scaffold(
                              body: CustomScrollView(
                            slivers: [
                              SliverGrid.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                    childAspectRatio: 1,
                                  ),
                                  itemBuilder: (context, index) => Card(
                                        color: Colors.blue,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              // Text(adsList[index].suspensaoDianteira!),
                                              // Text(adsList[index].suspensaoTraseira!),
                                              // Text(adsList[index].tipo!)

                                              Image.network(
                                                '',
                                                fit: BoxFit.cover,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    adsList[index].marca!,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Text(adsList[index]
                                                          .price
                                                          ?.toStringAsFixed(
                                                              2) ??
                                                      '0.00',
                                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                                ],
                                              ),
                                            
                                              

                                              SizedBox(
                                                width: 200,
                                                child: MyButtonAgree(
                                                  text: "Comprar",
                                                  image:
                                                      "site-sistema/Home/icone-seta.svg",
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomePage()),
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                  itemCount: adsList?.length),
                            ],
                          ))),
                      if (Responsive.isMobile(context))
                        const PreferredSize(
                          preferredSize: Size(double.infinity, 56),
                          child: rodapeApp(),
                        )
                      else
                        (const PreferredSize(
                          preferredSize: Size(double.infinity, 72),
                          child: Rodape(),
                        )),
                    ]))
                  ]))));
    });
  }

  Future<void> getDados() async {
    await _adsService.getAds().then((value) => adsList.addAll(value));
    setState(() {});
  }
}
