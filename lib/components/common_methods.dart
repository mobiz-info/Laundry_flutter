import 'package:flutter/material.dart';
import 'package:golden_falcon/src/Color.dart';

enum MessageType { success, error }

void snackBar(BuildContext context, {required String message, var type = MessageType.error}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: type == MessageType.success ? Colors.green : Colors.red,
      content: Text(message, textAlign: TextAlign.start, style: const TextStyle(color: Colors.white))));
}

showLoaderDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    backgroundColor: Colors.white,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(color: primaryColor),
        Container(
            margin: const EdgeInsets.only(left: 18),
            child: const Text("Loading...")),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}
