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
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        ElevatedButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).clearMaterialBanners(),
            child: Text("X"))
      ],
    ));
    await fecharMessagem().timeout(const Duration(seconds: 10), onTimeout: () => {ScaffoldMessenger.of(context).clearMaterialBanners()});
  }

  /// Prints "printed" after five seconds.
  Future<void> fecharMessagem() async {
    await Future.delayed(const Duration(seconds: 5));
    print("CHAMOUUUUUU!");
    //;
  }

  void showError(String message) => _showMessage(message, Colors.red);
  void showInfo(String message) =>
      _showMessage(message, Theme.of(context).primaryColor);
}
