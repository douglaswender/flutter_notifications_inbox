import 'package:flutter/material.dart';

class SendDialog {
  static Future<void> open(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog();
      },
    );
  }
}
