import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// Singleton class to provide consistent text styles across the app.
class FontStyles {
  static final FontStyles _instance = FontStyles._internal();

  factory FontStyles() => _instance;

  FontStyles._internal();

  static FontStyles get instance => _instance;

  TextStyle p16 = TextStyle(fontSize: 16.sp, height: 1.5);
  TextStyle p14 = TextStyle(fontSize: 14.sp, height: 1.5);

  TextStyle p16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
}
