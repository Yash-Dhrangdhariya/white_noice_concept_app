import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/vectors.dart';
import '../../../values/app_constants.dart';
import '../../../values/app_themes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({this.state = CrossFadeState.showFirst, super.key});

  final CrossFadeState state;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      sizeCurve: Curves.fastEaseInToSlowEaseOut,
      firstChild: Align(
        child: SvgPicture.asset(Vectors.forest, width: 30),
      ),
      secondChild: const Text(
        'White noise',
        style: AppThemes.titleSmall,
      ),
      crossFadeState: state,
      duration: AppConstants.defaultDuration,
    );
  }
}
