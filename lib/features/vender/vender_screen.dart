import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../componentes/DrawerApp.dart';
import '../../componentes/button.dart';
import '../../componentes/cabecalho.dart';
import '../../componentes/cabecalhoapp.dart';
import '../../componentes/messages.dart';
import '../../componentes/rodape.dart';
import '../../componentes/rodapeApp.dart';
import '../../componentes/formulario.dart';
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
  late String _marca = 'Caloi';
  late String _tipo = 'Mountain Bike';
  late String _quadro = 'S';
  late String _aro = '16';

  final tipoController = TextEditingController();
  final tamanhoController = TextEditingController();
  final aroController = TextEditingController();
  final descricaoController = TextEditingController();
  final AdsService _adsService = AdsService();
  int currentStep = 0;

  @override
  void initState() {
    // _requestUser();
    super.initState();
  }

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
                          ? MediaQuery.of(context).size.width * 0.80
                          : null,
                      child: Stepper(
                          type: StepperType.horizontal,
                          steps: getSteps(),
                          currentStep: currentStep,
                          onStepContinue: () {
                            final isLastStep =
                                currentStep == getSteps().length - 1;

                            if (isLastStep) {
                              print('Completo');
                              // Enviar dados para o servidor
                            } else {
                              setState(() => currentStep += 1);
                            }
                          },
                          onStepCancel: currentStep == 0
                              ? null
                              : () => setState(() => currentStep -= 1),
                        ),
                      ),
                    

                    // ListView(
                    //   shrinkWrap: true,
                    //   children: [

                    // Container(
                    //   padding: const EdgeInsets.all(20.0),
                    //   child:

                    // Column(children: [
                    //   ClipRect(
                    //     child: BackdropFilter(
                    //       filter: ImageFilter.blur(),
                    //       child: Container(
                    //         padding: const EdgeInsets.only(
                    //           right: 10,
                    //           left: 10,
                    //           top: 10,
                    //           bottom: 10,
                    //         ),
                    //         decoration: const BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.all(
                    //                 Radius.circular(20))),
                    //         width: Responsive.isDesktop(context)
                    //             ? MediaQuery.of(context).size.width * 0.4
                    //             : null,
                    //         height: Responsive.isTablet(context)
                    //             ? MediaQuery.of(context).size.width * 0.80
                    //             : null,
                    //         child: const Padding(
                    //           padding: EdgeInsets.all(16.0),
                    //child:
                    // Form(
                    //   key: _formKey,
                    //   child: Center(
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       mainAxisAlignment:
                    //           MainAxisAlignment.start,
                    //       crossAxisAlignment:
                    //           CrossAxisAlignment.stretch,
                    //       children: [
                    //         const Text(
                    //           "Dados da bike",
                    //           style: TextStyle(
                    //               color: Colors.black,
                    //               fontSize: 20,
                    //               fontWeight: FontWeight.bold),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         // MyTextField(
                    //         //   hintText: 'Marca do quadro',
                    //         //   controller: marcaController,
                    //         //   obscureText: false,
                    //         //   inputFormatter: [],
                    //         // ),
                    //         const Text('Marca',
                    //             style: TextStyle(
                    //                 fontWeight:
                    //                     FontWeight.bold)),
                    //         DropdownButton(
                    //           items: const [
                    //             DropdownMenuItem(
                    //               value: "Caloi",
                    //               child: Text("Caloi"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "Monarca",
                    //               child: Text("Monarca"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "Audax",
                    //               child: Text("Audax"),
                    //             ),
                    //           ],
                    //           value: _marca,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               _marca = value!;
                    //             });
                    //           },
                    //           isExpanded: true,
                    //           hint: const Text("Marca"),
                    //         ),
                    //         const SizedBox(width: 50),
                    //         const SizedBox(height: 50),
                    //         // MyTextField(
                    //         //   hintText:
                    //         //       'Tipo (Mountain bike, Speed...)',
                    //         //   controller: tipoController,
                    //         //   obscureText: false,
                    //         //   inputFormatter: [],
                    //         // ),
                    //         const Text(
                    //           'Tipo',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         DropdownButton(
                    //           items: const [
                    //             DropdownMenuItem(
                    //               value: "Mountain Bike",
                    //               child: Text("Mountain Bike"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "Speed",
                    //               child: Text("Speed"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "BMX",
                    //               child: Text("BMX"),
                    //             ),
                    //           ],
                    //           value: _tipo,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               _tipo = value!;
                    //             });
                    //           },
                    //           isExpanded: true,
                    //           hint: const Text("Tipo"),
                    //         ),

                    //         const SizedBox(width: 50),
                    //         const SizedBox(height: 50),
                    //         // MyTextField(
                    //         //   hintText: 'Tamanho do quadro',
                    //         //   controller: tamanhoController,
                    //         //   obscureText: false,
                    //         //   inputFormatter: [],
                    //         // ),
                    //         const Text('Tamanho do quadro',
                    //             style: TextStyle(
                    //                 fontWeight:
                    //                     FontWeight.bold)),
                    //         DropdownButton(
                    //           items: const [
                    //             DropdownMenuItem(
                    //               value: "S",
                    //               child: Text("S"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "M",
                    //               child: Text("M"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "L",
                    //               child: Text("L"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "XL",
                    //               child: Text("XL"),
                    //             ),
                    //           ],
                    //           value: _quadro,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               _quadro = value!;
                    //             });
                    //           },
                    //           isExpanded: true,
                    //           hint: const Text(
                    //               "Tamanho do quadro",
                    //               style: TextStyle(
                    //                   fontWeight:
                    //                       FontWeight.bold)),
                    //         ),

                    //         const SizedBox(width: 50),
                    //         const SizedBox(height: 50),
                    //         // MyTextField(
                    //         //   hintText: 'Número do aro',
                    //         //   controller: aroController,
                    //         //   obscureText: false,
                    //         //   inputFormatter: [],
                    //         // ),
                    //         const Text('Tamanho do aro',
                    //             style: TextStyle(
                    //                 fontWeight:
                    //                     FontWeight.bold)),
                    //         DropdownButton(
                    //           items: const [
                    //             DropdownMenuItem(
                    //               value: "16",
                    //               child: Text("16"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "20",
                    //               child: Text("20"),
                    //             ),
                    //             DropdownMenuItem(
                    //               value: "24",
                    //               child: Text("24"),
                    //             ),
                    //           ],
                    //           value: _aro,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               _aro = value!;
                    //             });
                    //           },
                    //           isExpanded: true,
                    //           hint:
                    //               const Text("Tamanho do aro"),
                    //         ),

                    //         //
                    //         //const Formulario(),
                    //         //

                    //         const SizedBox(width: 50),
                    //         const SizedBox(height: 50),
                    //         MyTextField(
                    //           hintText: 'Descrição',
                    //           controller: descricaoController,
                    //           obscureText: false,
                    //           inputFormatter: [],
                    //         ),
                    //         const SizedBox(width: 50),
                    //         const SizedBox(height: 50),
                    //         MyButtonAgree(
                    //           text: "Salvar",
                    //           image:
                    //               "site-sistema/Home/icone-seta.svg",
                    //           onTap: () {
                    //             registrar(
                    //               // marcaController.text,
                    //               // tipoController.text,
                    //               // tamanhoController.text,
                    //               // aroController.text,
                    //               _marca,
                    //               _aro,
                    //               _quadro,
                    //               _tipo,
                    //               descricaoController.text,
                    //             );
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   if (Responsive.isMobile(context))
                    //     const PreferredSize(
                    //       preferredSize: Size(double.infinity, 56),
                    //       child: rodapeApp(),
                    //     )
                    //   else
                    //     (PreferredSize(
                    //       preferredSize: const Size(double.infinity, 72),
                    //       child: Rodape(),
                    //     )),
                    // ]),
                    // ),
                    // ],
                    // )
                    )));
      },
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(
            "Dados da bike",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              const Text('Marca',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Caloi",
                    child: Text("Caloi"),
                  ),
                  DropdownMenuItem(
                    value: "Monarca",
                    child: Text("Monarca"),
                  ),
                  DropdownMenuItem(
                    value: "Audax",
                    child: Text("Audax"),
                  ),
                ],

                // value: _marca,
                // onChanged: (value) {
                //   setState(() {
                //     _marca = value!;
                //   });
                // },

                isExpanded: true,
                hint: const Text(""),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text(
                'Tipo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Mountain Bike",
                    child: Text("Mountain Bike"),
                  ),
                  DropdownMenuItem(
                    value: "Speed",
                    child: Text("Speed"),
                  ),
                  DropdownMenuItem(
                    value: "BMX",
                    child: Text("BMX"),
                  ),
                ],
                // value: _tipo,
                // onChanged: (value) {
                //   setState(() {
                //     _tipo = value!;
                //   });
                // },
                isExpanded: true,
                hint: const Text(""),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text('Tamanho do quadro',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "S",
                    child: Text("S"),
                  ),
                  DropdownMenuItem(
                    value: "M",
                    child: Text("M"),
                  ),
                  DropdownMenuItem(
                    value: "L",
                    child: Text("L"),
                  ),
                  DropdownMenuItem(
                    value: "XL",
                    child: Text("XL"),
                  ),
                ],

                // value: _quadro,
                // onChanged: (value) {
                //   setState(() {
                //     _quadro = value!;
                //   });
                // },

                isExpanded: true,
                hint: const Text("",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text('Tamanho do aro',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "16",
                    child: Text("16"),
                  ),
                  DropdownMenuItem(
                    value: "20",
                    child: Text("20"),
                  ),
                  DropdownMenuItem(
                    value: "24",
                    child: Text("24"),
                  ),
                ],
                // value: _aro,
                // onChanged: (value) {
                //   setState(() {
                //     _aro = value!;
                //   });
                // },
                isExpanded: true,
                hint: const Text(""),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text('Modalidade',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "BMX",
                    child: Text("BMX"),
                  ),
                  DropdownMenuItem(
                    value: "Dowmhill",
                    child: Text("Dowmhill"),
                  ),
                  DropdownMenuItem(
                    value: "MTB",
                    child: Text("MTB"),
                  ),
                ],
                // value: _modalidade,
                // onChanged: (value) {
                //   setState(() {
                //     _modalidade = value!;
                //   });
                // },
                isExpanded: true,
                hint: const Text(""),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text('Ano', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "2023",
                    child: Text("2023"),
                  ),
                  DropdownMenuItem(
                    value: "2022",
                    child: Text("2022"),
                  ),
                  DropdownMenuItem(
                    value: "2021",
                    child: Text("2021"),
                  ),
                  DropdownMenuItem(
                    value: "2020",
                    child: Text("2020"),
                  ),
                ],
                // value: _modalidade,
                // onChanged: (value) {
                //   setState(() {
                //     _modalidade = value!;
                //   });
                // },
                isExpanded: true,
                hint: const Text(""),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text('Material',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Aço",
                    child: Text("Aço"),
                  ),
                  DropdownMenuItem(
                    value: "Cromoloy",
                    child: Text("Cromoloy"),
                  ),
                  DropdownMenuItem(
                    value: "Alumínio",
                    child: Text("Alumínio"),
                  ),
                  DropdownMenuItem(
                    value: "Fibra de carobno",
                    child: Text("Fibra de carbono"),
                  ),
                  DropdownMenuItem(
                    value: "Titânio",
                    child: Text("Titânio"),
                  ),
                ],
                // value: _modalidade,
                // onChanged: (value) {
                //   setState(() {
                //     _modalidade = value!;
                //   });
                // },
                isExpanded: true,
                hint: const Text(""),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text('Condição',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Nova",
                    child: Text("Nova"),
                  ),
                  DropdownMenuItem(
                    value: "Seminova",
                    child: Text("Seminova"),
                  ),
                  DropdownMenuItem(
                    value: "Usada",
                    child: Text("Usada"),
                  ),
                ],
                // value: _modalidade,
                // onChanged: (value) {
                //   setState(() {
                //     _modalidade = value!;
                //   });
                // },
                isExpanded: true,
                hint: const Text(""),
              ),
              const SizedBox(width: 50),
              const SizedBox(height: 50),
              const Text('Estado de conservação',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Razoável",
                    child: Text("Razoável"),
                  ),
                  DropdownMenuItem(
                    value: "Bom",
                    child: Text("Bom"),
                  ),
                  DropdownMenuItem(
                    value: "Ótimo",
                    child: Text("Ótima"),
                  ),
                  DropdownMenuItem(
                    value: "Impecável",
                    child: Text("Impecável"),
                  ),
                ],
                // value: _modalidade,
                // onChanged: (value) {
                //   setState(() {
                //     _modalidade = value!;
                //   });
                // },
                isExpanded: true,
                hint: const Text(""),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Endereço'),
          content: const Column(
            children: <Widget>[],
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Completo'),
          content: const Column(
            children: <Widget>[],
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text('Completo'),
          content: const Column(
            children: <Widget>[],
          ),
        ),
      ];

  Future<void> _requestUser() async {
    final user = await SessionManager().get('accessToken');
    if (user == null) {
      setState(() {
        Navigator.pushNamedAndRemoveUntil(
            context, "/login", ModalRoute.withName('/'));
      });
    }
    //nomeUsuario = user['nome_usuario'];
  }

  Future<void> registrar(
    String marca,
    String tipo,
    String tamanho,
    String aro,
    String descricao,
  ) async {
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
      print(e);
      _showToastErro(context, 'Ops, algo deu errado! ${e}');
    }
  }

  void _showToastErro(BuildContext context, msg) {
    Messages.of(context).showError(msg);
  }

  void _showToastInfo(BuildContext context, msg) {
    Messages.of(context).showInfo(msg);
  }
}
