import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center( // Centralizar o contêiner
          child: Container(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width * 0.4
                : null,
            height: Responsive.isTablet(context)
                ? MediaQuery.of(context).size.width * 0.80
                : null,
            color: Colors.white,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color.fromARGB(255, 8, 188, 138),
                ),
              ),
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
          ),
        ),
      );

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
}
