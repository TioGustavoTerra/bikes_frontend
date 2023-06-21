import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatter;
  const MyTextField({
  super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText,
  required this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? 'Por favor, insira ${hintText}' : null,
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

class MyPasswordTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyPasswordTextField({
  super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? 'Por favor, insira ${hintText}' : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.visibility_off),
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
    );
  }
}