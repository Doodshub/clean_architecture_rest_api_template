import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CircleShapeButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  const CircleShapeButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 70,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: backgroundColor ?? CustomAppColors.gray4.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: size! - (size! * 0.3),
            color: iconColor ?? CustomAppColors.gray2,
          ),
        ),
      ),
    );
  }
}
