import 'dart:ui';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../componentes/DrawerApp.dart';
import '../../componentes/cabecalho.dart';
import '../../componentes/cabecalhoapp.dart';
import '../../componentes/rodape.dart';
import '../../componentes/rodapeApp.dart';
import '../../componentes/textfield.dart';
import '../../utils/responsive.dart';

class Contato extends StatelessWidget {
  Contato({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final telController = TextEditingController();
  final areaTexto = TextEditingController();

  get _formKey => null;

  @override
  Widget build(BuildContext context) {
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
        body: Center(
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * 0.4
                      : null,
                  height: Responsive.isTablet(context)
                      ? MediaQuery.of(context).size.height * 0.80
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SvgPicture.asset(
                                'site-sistema/Menu/Logo-bikes.svg',
                              ),
                              const Text("Entre em contato",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  textAlign: TextAlign.center),
                              MyTextField(
                                hintText: 'Nome completo',
                                controller: usernameController,
                                obscureText: false,
                                inputFormatter: const [],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: MyTextField(
                                      hintText: 'Telefone',
                                      controller: telController,
                                      obscureText: false,
                                      inputFormatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        TelefoneInputFormatter(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: MyTextField(
                                      hintText: 'Email',
                                      controller: emailController,
                                      obscureText: false,
                                      inputFormatter: const [],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                  controller: areaTexto,
                                  hintText: "Digite aqui!",
                                  obscureText: false,
                                  inputFormatter: const []),
                              const SizedBox(height: 10),
                            ]),
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
              (const PreferredSize(
                preferredSize: Size(double.infinity, 72),
                child: Rodape(),
              )),
          ]),
        ));
  }
}
