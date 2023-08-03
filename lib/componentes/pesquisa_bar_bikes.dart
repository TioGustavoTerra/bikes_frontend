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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                  width: 439,
                  height: 100,
                  child: Column(children: [ColorOptions(), TextField()])),
              SizedBox(
                  width: 100,
                  height: 100,
                  child: IconButton.filled(
                      style: ButtonStyle(
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
          label: Padding(padding: EdgeInsets.only(left:2, right: 2), child: Text('Bikes' , style: TextStyle(height: 2, letterSpacing: 4, fontSize: 20, fontWeight: FontWeight.bold),)),
        ),
        ButtonSegment<Color>(
          value: Color.green,
          label: Text('Peças e Acessórios', style: TextStyle(
                  letterSpacing: 1, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ],
      // style: buttonStyle,
    );
  }
}
