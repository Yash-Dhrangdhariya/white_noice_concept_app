import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.onTap,
    required this.icon,
    required this.size,
    this.padding = true,
    this.fgColor,
    this.bgColor,
    super.key,
  });

  final VoidCallback onTap;
  final String icon;
  final double size;
  final Color? bgColor;
  final Color? fgColor;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: ClipOval(
          child: ColoredBox(
            color: bgColor ?? Colors.grey.shade200,
            child: Padding(
              padding: EdgeInsets.all(
                padding ? 10 : 0,
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: fgColor != null
                    ? ColorFilter.mode(
                        fgColor!,
                        BlendMode.srcIn,
                      )
                    : null,
                width: size,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
