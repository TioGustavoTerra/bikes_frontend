import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatter;

  const CpfTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (val!.isEmpty) {
          return 'Por favor, insira ${hintText}';
        } else if (!UtilBrasilFields.isCPFValido(val)) {
          return 'CPF inválido';
        } else {
          return null;
        }
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
      inputFormatters: inputFormatter,
    );
  }
}
