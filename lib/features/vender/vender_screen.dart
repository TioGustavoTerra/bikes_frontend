import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../componentes/DrawerApp.dart';
import '../../componentes/cabecalho.dart';
import '../../componentes/cabecalhoapp.dart';
import '../../componentes/messages.dart';
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
    _requestUser();
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
                        ? MediaQuery.of(context).size.width * 0.45
                        : null,
                    height: Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.height * 0.80
                        : null,
                    child: Stepper(
                      type: StepperType.horizontal,
                      steps: getSteps(),
                      currentStep: currentStep,
                      onStepContinue: () {
                        final isLastStep = currentStep == getSteps().length - 1;

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
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                // value: _ano,
                // onChanged: (value) {
                //   setState(() {
                //     _ano = value!;
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
                // value: _material,
                // onChanged: (value) {
                //   setState(() {
                //     _material = value!;
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
                // value: _condicao,
                // onChanged: (value) {
                //   setState(() {
                //     _condicao = value!;
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
                // value: _conserva,
                // onChanged: (value) {
                //   setState(() {
                //     _conserva = value!;
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
          title: const Text(
            'Informações opcionais',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              const Text('Garfo',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "RockShox",
                    child: Text("RockShox"),
                  ),
                  DropdownMenuItem(
                    value: "Fox Racing Shox",
                    child: Text("Fox Racing Shox"),
                  ),
                  DropdownMenuItem(
                    value: "Manitou",
                    child: Text("Manitou"),
                  ),
                  DropdownMenuItem(
                    value: "Marzocchi",
                    child: Text("Marzocchi"),
                  ),
                  DropdownMenuItem(
                    value: "RST",
                    child: Text("RST"),
                  ),
                  DropdownMenuItem(
                    value: "Lauf",
                    child: Text("Lauf"),
                  ),
                  DropdownMenuItem(
                    value: "CarbonCycles",
                    child: Text("CarbonCycles"),
                  ),
                ],
                // value: _garfo,
                // onChanged: (value) {
                //   setState(() {
                //     _garfo = value!;
                //   });
                // },

                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Suspenção dianteira',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "RockShox",
                    child: Text("RockShox"),
                  ),
                  DropdownMenuItem(
                    value: "Fox Racing Shox",
                    child: Text("Fox Racing Shox"),
                  ),
                  DropdownMenuItem(
                    value: "Manitou",
                    child: Text("Manitou"),
                  ),
                  DropdownMenuItem(
                    value: "Suntour",
                    child: Text("Suntour"),
                  ),
                  DropdownMenuItem(
                    value: "Marzocchi",
                    child: Text("Marzocchi"),
                  ),
                  DropdownMenuItem(
                    value: "DT Swiss",
                    child: Text("DT Swiss"),
                  ),
                  DropdownMenuItem(
                    value: "X-Fusion",
                    child: Text("X-Fusion"),
                  ),
                ],
                // value: _suspensao,
                // onChanged: (value) {
                //   setState(() {
                //     _suspensao = value!;
                //   });
                // },

                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Suspenção traseira',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "RockShox",
                    child: Text("RockShox"),
                  ),
                  DropdownMenuItem(
                    value: "Fox Racing Shox",
                    child: Text("Fox Racing Shox"),
                  ),
                  DropdownMenuItem(
                    value: "Cane Creek",
                    child: Text("Cane Creek"),
                  ),
                  DropdownMenuItem(
                    value: "Ohlins",
                    child: Text("Ohlins"),
                  ),
                  DropdownMenuItem(
                    value: "DVO ",
                    child: Text("DVO "),
                  ),
                  DropdownMenuItem(
                    value: "X-Fusion",
                    child: Text("X-Fusion"),
                  ),
                  DropdownMenuItem(
                    value: "DT Swiss",
                    child: Text("DT Swiss"),
                  ),
                ],
                // value: _suspensaoT,
                // onChanged: (value) {
                //   setState(() {
                //     _suspensaoT = value!;
                //   });
                // },

                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Peso', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "6,8 a 8 KG",
                    child: Text("6,8 a 8 KG"),
                  ),
                  DropdownMenuItem(
                    value: "8 a 10 KG",
                    child: Text("8 a 10 KG"),
                  ),
                  DropdownMenuItem(
                    value: "9 a 12 KG",
                    child: Text("9 a 12 KG"),
                  ),
                  DropdownMenuItem(
                    value: "11 a 15 KG",
                    child: Text("11 a 15 KG"),
                  ),
                  DropdownMenuItem(
                    value: "14 a 18 KG",
                    child: Text("14 a 18 KG"),
                  ),
                ],
                // value: _peso,
                // onChanged: (value) {
                //   setState(() {
                //     _peso = value!;
                //   });
                // },

                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Transmissão traseira',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Nenhum",
                    child: Text("Nenhum"),
                  ),
                  DropdownMenuItem(
                    value: "Shimano Deore XT",
                    child: Text("Shimano Deore XT"),
                  ),
                  DropdownMenuItem(
                    value: "SRAM GX",
                    child: Text("SRAM GX"),
                  ),
                  DropdownMenuItem(
                    value: "Shimano 105",
                    child: Text("Shimano 105"),
                  ),
                  DropdownMenuItem(
                    value: "Campagnolo Chorus",
                    child: Text("Campagnolo Chorus"),
                  ),
                ],
                // value: _transmicao,
                // onChanged: (value) {
                //   setState(() {
                //     _transmicao = value!;
                //   });
                //},

                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Números de marchas traseiras',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("1"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("2"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("3"),
                  ),
                  DropdownMenuItem(
                    value: "4",
                    child: Text("4"),
                  ),
                  DropdownMenuItem(
                    value: "5",
                    child: Text("5"),
                  ),
                  DropdownMenuItem(
                    value: "6",
                    child: Text("6"),
                  ),
                  DropdownMenuItem(
                    value: "7",
                    child: Text("7"),
                  ),
                  DropdownMenuItem(
                    value: "8",
                    child: Text("8"),
                  ),
                  DropdownMenuItem(
                    value: "9",
                    child: Text("9"),
                  ),
                  DropdownMenuItem(
                    value: "10",
                    child: Text("10"),
                  ),
                  DropdownMenuItem(
                    value: "11",
                    child: Text("11"),
                  ),
                  DropdownMenuItem(
                    value: "12",
                    child: Text("12"),
                  ),
                  DropdownMenuItem(
                    value: "13",
                    child: Text("13"),
                  ),
                ],
                // value: _marchaT,
                // onChanged: (value) {
                //   setState(() {
                //     _marchaT = value!;
                //   });
                //},

                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Números de marchas dianteiras',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("1"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("2"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("3"),
                  ),
                ],
                // value: _marchaT,
                // onChanged: (value) {
                //   setState(() {
                //     _marchaT = value!;
                //   });
                //},

                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Marca dos freios',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Brembo",
                    child: Text("Brembo"),
                  ),
                  DropdownMenuItem(
                    value: "Akebono",
                    child: Text("Akebono"),
                  ),
                  DropdownMenuItem(
                    value: "EBC Brakes",
                    child: Text("EBC Brakes"),
                  ),
                  DropdownMenuItem(
                    value: "Wagner Brake",
                    child: Text("Wagner Brake"),
                  ),
                  DropdownMenuItem(
                    value: "TRW Automotive",
                    child: Text("TRW Automotive"),
                  ),
                  DropdownMenuItem(
                    value: "Wilwood Engineering",
                    child: Text("Wilwood Engineering"),
                  ),
                  DropdownMenuItem(
                    value: "Centric Parts",
                    child: Text("Centric Parts"),
                  ),
                  DropdownMenuItem(
                    value: "Raybestos3",
                    child: Text("Raybestos"),
                  ),
                ],
                // value: _freio,
                // onChanged: (value) {
                //   setState(() {
                //     _freio = value!;
                //   });
                //},

                isExpanded: true,
                hint: const Text(""),
              ),
                            const Text('Tipo do freio',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                onChanged: (value) {},
                items: const [
                  DropdownMenuItem(
                    value: "Freio a disco",
                    child: Text("Freio a disco"),
                  ),
                  DropdownMenuItem(
                    value: "Freio de aro",
                    child: Text("Freio de aro"),
                  ),
                  DropdownMenuItem(
                    value: "Freio a tambor",
                    child: Text("Freio a tambor"),
                  ),
                ],
                // value: _tipofreio,
                // onChanged: (value) {
                //   setState(() {
                //     _tipofreio = value!;
                //   });
                //},

                isExpanded: true,
                hint: const Text(""),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(
            'últimas informações',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: const Column(
            children: <Widget>[
              Text(
                ' Adicionar Nota fiscal ou DARF Adicionar descrição Adicionar valor Adicionar desconto',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text(
            'Foto/vídeo',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: const Column(
            children: <Widget>[
              Text(
                'Foto/vídeo',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
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