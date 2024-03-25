import 'package:flutter/material.dart';

enum MessageType { success, error }

void snackBar(BuildContext context, {required String message, var type = MessageType.error}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: type == MessageType.success ? Colors.green : Colors.red,
      content: Text(message, textAlign: TextAlign.start, style: const TextStyle(color: Colors.white))));
}
