import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'values/app_themes.dart';

class WhiteNoiceApp extends StatelessWidget {
  const WhiteNoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
