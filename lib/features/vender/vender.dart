import 'dart:ui';

import 'package:flutter/material.dart';

import '../../componentes/DrawerApp.dart';
import '../../componentes/button.dart';
import '../../componentes/cabecalho.dart';
import '../../componentes/cabecalhoapp.dart';
import '../../componentes/messages.dart';
import '../../componentes/rodape.dart';
import '../../componentes/rodapeApp.dart';
import '../../componentes/textfield.dart';
import '../../models/ads.dart';
import '../../utils/responsive.dart';
import '../../services/ads_service.dart';

class Vender extends StatefulWidget {
  const Vender({super.key});

  @override
  State<Vender> createState() => _VenderState();
}

class _VenderState extends State<Vender> {
  final _formKey = GlobalKey<FormState>();
  final marcaController = TextEditingController();
  final tipoController = TextEditingController();
  final tamanhoController = TextEditingController();
  final aroController = TextEditingController();
  final descricaoController = TextEditingController();
  final AdsService _adsService = AdsService();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  width: Responsive.isDesktop(context)
                                      ? MediaQuery.of(context).size.width * 0.4
                                      : null,
                                  height: Responsive.isTablet(context)
                                      ? MediaQuery.of(context).size.width *
                                          0.80
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Form(
                                      key: _formKey,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const Text(
                                              "Dados da bike",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                            ),
                                            MyTextField(
                                              hintText: 'Marca do quadro',
                                              controller: marcaController,
                                              obscureText: false,
                                              inputFormatter: [],
                                            ),
                                            const SizedBox(width: 50),
                                            const SizedBox(height: 50),
                                            MyTextField(
                                              hintText:
                                                  'Tipo (Mountain bike, Speed...)',
                                              controller: tipoController,
                                              obscureText: false,
                                              inputFormatter: [],
                                            ),
                                            const SizedBox(width: 50),
                                            const SizedBox(height: 50),
                                            MyTextField(
                                              hintText: 'Tamanho do quadro',
                                              controller: tamanhoController,
                                              obscureText: false,
                                              inputFormatter: [],
                                            ),
                                            const SizedBox(width: 50),
                                            const SizedBox(height: 50),
                                            MyTextField(
                                              hintText: 'Número do aro',
                                              controller: aroController,
                                              obscureText: false,
                                              inputFormatter: [],
                                            ),
                                            const SizedBox(width: 50),
                                            const SizedBox(height: 50),
                                            MyTextField(
                                              hintText: 'Descrição',
                                              controller: descricaoController,
                                              obscureText: false,
                                              inputFormatter: [],
                                            ),
                                            const SizedBox(width: 50),
                                            const SizedBox(height: 50),
                                            MyButtonAgree(
                                              text: "Salvar",
                                              image:
                                                  "site-sistema/Home/icone-seta.svg",
                                              onTap: () {
                                              registrar(
                                            marcaController.text,
                                            tipoController.text,
                                            tamanhoController.text,
                                            aroController.text,
                                            descricaoController.text,);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
                          ]),
                        ),
                      ],
                    ))));
      },
    );
  }
  
   Future<void> registrar(
      String marca,
      String tipo,
      String tamanho,
      String aro,
      String descricao,) async {
    try {
      if (_formKey.currentState!.validate()) {
        var vender = Ads(
            marca: marca,
            tipo: tipo,
            tamanho: tamanho,
            aro: aro,
            descricao: descricao);

        Ads? user = await _adsService.registrar(vender);

        if (user != null) {
          _showToastInfo(context, 'Cadastro realizado com Sucesso!');
          Navigator.pushNamed(context, "/login");
        } else {
          _showToastErro(context, 'Ops, algo deu errado!');
        }
      } else {
        _showToastErro(context, 'Favor preencher todos os campos!');
      }
    } catch (e) {
      print (e);
      _showToastErro(context, 'Ops, algo deu errado! ${e}');
    }
  }

  void _showToastErro(BuildContext context, msg) {
    Messages.of(context).showError(msg);
  }

  void _showToastInfo(BuildContext context, msg) {
    Messages.of(context).showInfo(msg);
  }}

