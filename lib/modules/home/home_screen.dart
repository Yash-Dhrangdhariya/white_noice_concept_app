import 'package:flutter/material.dart';

import 'views/category_bar.dart';
import 'views/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeBody(),
          const SafeArea(
            child: VerticalDivider(color: Colors.grey, width: 1),
          ),
          const CategoryBar(),
        ],
      ),
    );
  }
}
