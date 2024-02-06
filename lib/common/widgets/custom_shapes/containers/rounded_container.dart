import 'package:flutter/material.dart';
import 'package:ozon_store/utils/constants/sizes.dart';

import '../../../../utils/constants/app_colors.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = AppSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = AppColors.textWhite,
    this.margin,
    this.showBorder = false,
    this.borderColor = AppColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgroundColor, border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
