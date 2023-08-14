
import 'package:bikes_frontend/main.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  int currentStep = 0;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Título"),
          centerTitle: true,
        ),
        body: Theme(
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
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              return Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(children: [
                  Expanded(child: ElevatedButton(onPressed: onStepContinue, child: Text('Next'),
                  ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: ElevatedButton(onPressed: onStepContinue, child: Text('Next'),
                  ),
                  )
                ]),
              )
            },
          ),
        ),
      );

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Conta'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: firstName,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                controller: lastName,
                decoration: const InputDecoration(labelText: 'Sobrenome'),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Endereço'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: address,
                decoration: const InputDecoration(labelText: 'Endereço'),
              ),
              TextFormField(
                controller: postcode,
                decoration: const InputDecoration(labelText: 'CEP'),
              ),
            ],
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
      ];
}