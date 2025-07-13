import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/theme/colors/app_colors.dart';
import 'package:weather_app/src/core/theme/fonts/font_styles.dart';


/// A reusable styled [TextFormField] widget.
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.label,
    required this.hintText,
    this.maxLines,
    this.keyboardType,
    this.prefixIcon,
    this.onChanged,
    this.isFiledRequired = true,
    this.validator,
  });

  final String? label;
  final String hintText;
  final int? maxLines;
  final bool isFiledRequired;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        hintStyle: FontStyles.instance.p16.copyWith(color: AppColors.hintColor),
        fillColor: AppColors.textFieldFillColor,
        filled: true,
        border: customInputDecoration(),
        enabledBorder: customInputDecoration(),
        focusedBorder: customInputDecoration(color: AppColors.borderColor),
        disabledBorder: customInputDecoration(),
      ),
    );
  }

  customInputDecoration({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: color ?? Colors.transparent),
    );
  }
}
