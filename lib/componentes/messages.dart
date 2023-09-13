import 'package:flutter/material.dart';

class Messages {
  final BuildContext context;

  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void _showMessage(String message, Color color) async {
    ScaffoldMessenger.of(context).showMaterialBanner(
        // SnackBar(
        //   content: Text(message),
        //   backgroundColor: color,
        // ),
        MaterialBanner(
      backgroundColor: color,
      content: Center(
          child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      )),
      actions: [
        ElevatedButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).clearMaterialBanners(),
            child: const Text("X"))
      ],
    ));
    await fecharMessagem(5).timeout(const Duration(seconds: 10),
        onTimeout: () =>
            {ScaffoldMessenger.of(context).clearMaterialBanners()});
  }

  /// Prints "printed" after five seconds.
  Future<void> fecharMessagem(int tempo) async {
    await Future.delayed(Duration(seconds: tempo));
    ScaffoldMessenger.of(context).clearMaterialBanners();
  }

  void showError(String message) => _showMessage(message, Colors.red);
  void showInfo(String message) =>
      _showMessage(message, Theme.of(context).primaryColor);
}
