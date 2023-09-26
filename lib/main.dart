import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_noice_concept_app/app_modules.dart';
import 'package:white_noice_concept_app/white_noice_app.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModules(),
      child: const WhiteNoiceApp(),
    ),
  );
}
