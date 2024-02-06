import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 200,
    this.padding = 0,
    this.child,
    this.backgroundColor = AppColors.textWhite,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? 400,
      height: height ?? 400,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgroundColor),
    );
  }
}
