import 'package:flutter/material.dart';

class Messages {
  final BuildContext context;

  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showMaterialBanner(
        // SnackBar(
        //   content: Text(message),
        //   backgroundColor: color,
        // ),
        MaterialBanner(
       backgroundColor: color,
      content: Text(message, style: TextStyle(color: Colors.white),),
      actions: [ElevatedButton(onPressed: () => ScaffoldMessenger.of(context).clearMaterialBanners(), child: Text("X"))],
    ));
  }

  void showError(String message) => _showMessage(message, Colors.red);
  void showInfo(String message) =>
      _showMessage(message, Theme.of(context).primaryColor);
}
