import 'package:flutter/material.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/helpers/functions.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerEffect extends StatelessWidget {
  const AppShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15.0,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = AppFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: dark ? Colors.grey[800]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (dark ? AppColors.darkerGrey : Colors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
