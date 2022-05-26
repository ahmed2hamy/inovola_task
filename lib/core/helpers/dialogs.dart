import 'package:flutter/material.dart';

class Dialogs {
  static showAppSnackBar({
    required BuildContext context,
    required String content,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
        ),
      );
    });
  }
}
