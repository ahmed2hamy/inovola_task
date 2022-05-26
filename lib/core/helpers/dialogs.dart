import 'package:flutter/material.dart';

class Dialogs {
  static showAppSnackBar({
    required BuildContext context,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
