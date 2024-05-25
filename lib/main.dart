import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_modules.dart';
import 'white_noice_app.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModules(),
      child: const WhiteNoiceApp(),
    ),
  );
}
