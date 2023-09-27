import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WhiteNoiceApp extends StatelessWidget {
  const WhiteNoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        sliderTheme: SliderThemeData(
          trackHeight: 2,
          activeTrackColor: Colors.blue.shade100,
          thumbColor: Colors.blue.shade300,
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 16,
          ),
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 4,
          ),
        ),
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
