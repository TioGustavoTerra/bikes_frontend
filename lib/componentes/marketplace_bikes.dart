import 'package:bikes_frontend/componentes/top_section.dart';
import 'package:flutter/material.dart';

class MarketplaceBikes extends StatefulWidget {
  const MarketplaceBikes({Key? key}) : super(key: key);

  @override
  _MarketplaceBikesState createState() => _MarketplaceBikesState();
}

class _MarketplaceBikesState extends State<MarketplaceBikes> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: ListView(
            children: [
              TopSection(),
              Positioned(
                  height: -500,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 400,
                            child: Column(
                                children: [ColorOptions(), TextField()])),
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: IconButton.filled(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(80, 80)),
                                    shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    )),
                                onPressed: () {},
                                icon: const Icon(Icons.search)))
                      ]))
            ],
          ),
        ));
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
