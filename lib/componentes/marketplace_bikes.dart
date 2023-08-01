import 'package:bikes_frontend/componentes/grid_marcas.dart';
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
                        child: Column(children: [ColorOptions(), TextField()])),
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
          Card(
            color: Colors.blue[100],
            child: Container(),
          ),
          Card(
            color: Colors.blue[100],
            child: Container(),
          ),
          Card(
            color: Colors.blue[100],
            child: Container(),
          ),
        ]
    ]),);
  }
}
