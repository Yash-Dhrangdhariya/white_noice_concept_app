import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.onTap,
    required this.icon,
    required this.size,
    this.padding = const EdgeInsets.all(10),
    this.fgColor,
    this.bgColor,
    super.key,
  });

  final VoidCallback onTap;
  final String icon;
  final double size;
  final Color? bgColor;
  final Color? fgColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor ?? Colors.grey.shade200,
        ),
        padding: padding,
        child: SvgPicture.asset(
          icon,
          width: size,
          colorFilter: fgColor == null
              ? null
              : ColorFilter.mode(fgColor!, BlendMode.srcIn),
        ),
      ),
    );
  }
}
