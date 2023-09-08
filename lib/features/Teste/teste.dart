import 'package:flutter/material.dart';

void main() {
  runApp(Teste());
}

class Teste extends StatelessWidget {
  // URL da imagem (pode ser vazia ou indefinida)
  final String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de Imagem da URL no Flutter'),
        ),
        body: Center(
          child: imageUrl.isNotEmpty // Verifica se a URL não está vazia
              ? Image.network(
                  imageUrl,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                )
              : Placeholder(), // Se a URL estiver vazia, exibe um placeholder
        ),
      ),
    );
  }
}
