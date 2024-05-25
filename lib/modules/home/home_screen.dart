import 'package:flutter/material.dart';

import 'views/category_bar.dart';
import 'views/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: MusicPlayer(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeBody(),
            VerticalDivider(
              color: Colors.grey,
              width: 1,
            ),
            CategoryBar(),
          ],
        ),
      ),
    );
  }
}
