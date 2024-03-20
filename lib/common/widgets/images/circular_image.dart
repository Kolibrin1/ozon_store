import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ozon_store/common/widgets/shimmers/shimmer_effect_widget.dart';
import 'package:ozon_store/utils/constants/app_colors.dart';
import 'package:ozon_store/utils/constants/sizes.dart';
import 'package:ozon_store/utils/helpers/functions.dart';

class AppCircularImage extends StatelessWidget {
  const AppCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = AppSizes.sm,
    required this.image,
    this.isNetworkImage = false,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.overlayColor,
  });

  final double width, height, padding;
  final String image;
  final bool isNetworkImage;
  final BoxFit? fit;
  final Color? backgroundColor;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (AppFunctions.isDarkMode(context) ? AppColors.black : AppColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  color: overlayColor,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, downloadProgress) => const AppShimmerEffect(width: 35, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
