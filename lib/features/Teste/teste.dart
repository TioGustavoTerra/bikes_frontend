import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  final TextEditingController _priceController = TextEditingController();
  double _price = 0.0;

  final TextEditingController _descricaoController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _updatePrice() {
    setState(() {
      final text = _priceController.text;
      _price = double.tryParse(text) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Bike'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _updatePrice();
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _updatePrice();
                _showSnackBar(context, 'Preço atualizado para \$${_price.toStringAsFixed(2)}');
              },
              child: Text('Salvar Preço'),
            ),
            SizedBox(height: 20.0),

          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
