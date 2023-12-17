import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WhiteNoiceApp extends StatelessWidget {
  const WhiteNoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        sliderTheme: SliderThemeData(
          trackHeight: 2,
          thumbColor: Colors.blue.shade300,
          activeTrackColor: Colors.blue.shade100,
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
