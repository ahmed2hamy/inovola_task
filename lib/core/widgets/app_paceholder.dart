import 'package:flutter/material.dart';
import 'package:inovola_task/constants/constants.dart';

class AppPlaceholder extends StatelessWidget {
  final BoxFit? fit;

  const AppPlaceholder({Key? key, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(kDefaultImage, fit: fit);
  }
}
