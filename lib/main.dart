import 'package:flutter/material.dart';
import 'package:inovola_task/main_app.dart';

import 'injection_container/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MainApp());
}
