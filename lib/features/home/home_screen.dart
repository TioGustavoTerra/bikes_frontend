import 'package:bikes_frontend/componentes/cabecalho.dart';
import 'package:bikes_frontend/componentes/cabecalhoapp.dart';
import 'package:bikes_frontend/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../componentes/DrawerApp.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    //_requestUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: Responsive.isMobile(context)
                ? const PreferredSize(
                    child: CabecalhoApp(),
                    preferredSize: Size(double.infinity, 56),
                  )
                : const PreferredSize(
                    child: Cabecalho(),
                    preferredSize: Size(double.infinity, 72)),
            drawer: Responsive.isMobile(context)
                ? const Drawer(child: DrawerApp())
                : null,
            body: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          width: 600,
                          height: 400,
                          child:
                              Column(children: [ColorOptions(), TextField()])),
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
                    ]),
              ),
            ));
      },
    );
  }

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
