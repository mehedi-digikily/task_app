import 'package:flutter/material.dart';

void snakeMessage(BuildContext context, String message,
    [bool eroMessage = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),
      backgroundColor: eroMessage ? Colors.red : null,
    ),);
}