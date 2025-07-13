import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/src/core/theme/colors/app_colors.dart';


/// A reusable widget to load network images with caching support.
class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      progressIndicatorBuilder:
          (context, url, progress) =>
              SpinKitCircle(color: color ?? AppColors.primaryColor),
      errorWidget:
          (context, url, error) => Center(
            child: Icon(
              Icons.no_photography_rounded,
              color: AppColors.primaryColor,
            ),
          ),
    );
  }
}
