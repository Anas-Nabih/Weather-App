import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/theme/colors/app_colors.dart';
import 'package:weather_app/src/core/theme/fonts/font_styles.dart';


/// A customizable button widget with consistent design.
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTapped, this.width});

  final String text;
  final Function()? onTapped;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            text,
            style: FontStyles.instance.p16Medium.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
