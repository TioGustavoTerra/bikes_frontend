import 'package:flutter/material.dart';

class PesquisaBarBikes extends StatefulWidget {
  const PesquisaBarBikes({Key? key}) : super(key: key);

  @override
  _PesquisaBarBikesState createState() => _PesquisaBarBikesState();
}

class _PesquisaBarBikesState extends State<PesquisaBarBikes> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 100,
                  child: const Column(children: [ColorOptions(), TextField()])),
              SizedBox(
                  width: 80,
                  height: 80,
                  child: IconButton.filled(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(80, 80)),
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          )),
                      onPressed: () {},
                      icon: const Icon(Icons.search)))
            ]));
  }
}

enum Color { red, green }

class ColorOptions extends StatefulWidget {
  const ColorOptions({super.key});

  @override
  State<ColorOptions> createState() => _ColorOptionsState();
}

class _ColorOptionsState extends State<ColorOptions> {
  Color _selectedColor = Color.red;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Color>(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(600, 400)),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          )),
      selected: <Color>{_selectedColor},
      showSelectedIcon: false,
      onSelectionChanged: (Set<Color> newSelection) {
        setState(() {
          _selectedColor = newSelection.first;
        });
      },
      segments: const <ButtonSegment<Color>>[
        ButtonSegment<Color>(
          value: Color.red,
          label: Text('Bikes'),
        ),
        ButtonSegment<Color>(
          value: Color.green,
          label: Text('Peças e Acessórios'),
        ),
      ],
      // style: buttonStyle,
    );
  }
}
