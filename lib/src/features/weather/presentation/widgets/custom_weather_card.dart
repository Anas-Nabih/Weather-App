import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/helper/extensions.dart';
import 'package:weather_app/src/core/theme/colors/app_colors.dart';
import 'package:weather_app/src/core/theme/fonts/font_styles.dart';
import 'package:weather_app/src/core/widgets/custom_cached_image.dart';
import 'package:weather_app/src/features/weather/domain/entities/weather_result.dart';

class CustomWeatherCard extends StatelessWidget {
  final WeatherResult info;

  const CustomWeatherCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (info.hasNetworkError)
          Text(
            'No internet connection, Please check your network',
            style: FontStyles.instance.p14.copyWith(
              color: Colors.red,
              fontStyle: FontStyle.italic,
            ),
          ),
        if (info.isCached)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              'Result From Last Search',
              style: FontStyles.instance.p14.copyWith(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.06),
                blurRadius: 4,
                spreadRadius: -2,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: -2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCachedImage(
                imageUrl:
                    info.weather.current.condition.icon
                        .toHighRes()
                        .addHttpPrefix(),
                fit: BoxFit.cover,
                width: 100.w,
                height: 100.h,
                color: Colors.white,
              ).animate().slideX(
                duration: 200.ms,
                begin: 1,
                curve: Curves.easeInSine,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${info.weather.location.country} - ${info.weather.cityName}',
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "${info.weather.condition} -  ${info.weather.temperature}°C'",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
