import 'dart:js_interop';
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
  late String _suspensao = 'RockShox';
  late String _suspensaoT = 'RockShox';
  late String _freio = 'Brembo';
  late String _tipofreio = 'Freio a disco';

  final tipoController = TextEditingController();
  final tamanhoController = TextEditingController();
  final aroController = TextEditingController();
  final descricaoController = TextEditingController();
  final AdsService _adsService = AdsService();
  int currentStep = 0;

// List of items in our dropdown menu
  var marcas = [
    'Caloi',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var tipos = [
    'Mountain Bike',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var quadros = [
    'S',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var aros = [
    '16',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var suspensaoDianteira = [
    'RockShox',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var suspensaoTraseira = [
    'RockShox',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var freios = [
    'Brembo',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var tiposFreios = [
    'Freio a disco',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
                      type: StepperType.vertical,
                      steps: getSteps(),
                      currentStep: currentStep,
                      onStepContinue: () {
                        final isLastStep = currentStep == getSteps().length - 1;

                        if (isLastStep) {
                          registrar(_marca, _tipo, _quadro, _aro, _suspensao,
                              _suspensaoT, _freio, _tipofreio);
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
                items: marcas.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _marca,
                onChanged: (value) {
                  setState(() {
                    _marca = value!;
                  });
                },
                isExpanded: true,
                hint: const Text(""),
              ),
              const Text(
                'Tipo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DropdownButton(
                items: tipos.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _tipo,
                onChanged: (value) {
                  setState(() {
                    _tipo = value!;
                  });
                },
                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Tamanho do quadro',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                items: quadros.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _quadro,
                onChanged: (value) {
                  setState(() {
                    _quadro = value!;
                  });
                },
                isExpanded: true,
                hint: const Text("",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Text('Tamanho do aro',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                items: aros.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _aro,
                onChanged: (value) {
                  setState(() {
                    _aro = value!;
                  });
                },
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
              const Text('Suspenção dianteira',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                items: suspensaoDianteira.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _suspensao,
                onChanged: (value) {
                  setState(() {
                    _suspensao = value!;
                  });
                },
                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Suspenção traseira',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                items: suspensaoTraseira.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _suspensaoT,
                onChanged: (value) {
                  setState(() {
                    _suspensaoT = value!;
                  });
                },
                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Marca dos freios',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                items: freios.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _freio,
                onChanged: (value) {
                  setState(() {
                    _freio = value!;
                  });
                },
                isExpanded: true,
                hint: const Text(""),
              ),
              const Text('Tipo do freio',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton(
                items: tiposFreios.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: _tipofreio,
                onChanged: (value) {
                  setState(() {
                    _tipofreio = value!;
                  });
                },
                isExpanded: true,
                hint: const Text(""),
              ),
            ],
          ),
        ),
        // Step(
        //   state: currentStep > 0 ? StepState.complete : StepState.indexed,
        //   isActive: currentStep >= 3,
        //   title: const Text(
        //     'Foto/vídeo',
        //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //   ),
        //   content: const Column(
        //     children: <Widget>[
        //       Text(
        //         'Foto/vídeo',
        //         style:
        //             TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
        // Step(
        //   state: currentStep > 0 ? StepState.complete : StepState.indexed,
        //   isActive: currentStep >= 2,
        //   title: const Text(
        //     'últimas informações',
        //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //   ),
        //   content: const Column(
        //     children: <Widget>[
        //       Text(
        //         'Adicionar Nota fiscal ou DARF; Adicionar descrição; Adicionar valor; Adicionar desconto',
        //         style:
        //             TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //       ),
        //     ],
        //   ),
        // ),
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
    String suspensao,
    String suspensaoT,
    String freio,
    String tipofreio,
  ) async {
    try {
      var vender = Ads(
        marca: marca,
        tipo: tipo,
        tamanho: tamanho,
        aro: int.parse(aro),
        suspensaoDianteira: suspensao,
        suspensaoTraseira: suspensaoT,
        freio: freio,
        tipofreio: tipofreio,
      );

      Ads? ads = await _adsService.registrar(vender);

      if (ads != null) {
        _showToastInfo(context, 'Anúnco realizado com Sucesso!');
        Messages.of(context).fecharMessagem(2).then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/home", ModalRoute.withName('/home'));
        });
      } else {
        _showToastErro(context, 'Ops, algo deu errado!');
      }
      // }

      // else {
      //   _showToastErro(context, 'Favor preencher todos os campos!');
      // }
    } catch (e) {
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
