/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDataGen {
  const $AssetsDataGen();

  /// File path: assets/data/weather.json
  String get weather => 'assets/data/weather.json';

  /// File path: assets/data/weather_animation.json
  String get weatherAnimation => 'assets/data/weather_animation.json';

  /// List of all assets
  List<String> get values => [weather, weatherAnimation];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Cairo-Medium.ttf
  String get cairoMedium => 'assets/fonts/Cairo-Medium.ttf';

  /// File path: assets/fonts/Cairo-Regular.ttf
  String get cairoRegular => 'assets/fonts/Cairo-Regular.ttf';

  /// File path: assets/fonts/Cairo-SemiBold.ttf
  String get cairoSemiBold => 'assets/fonts/Cairo-SemiBold.ttf';

  /// File path: assets/fonts/Poppins-Medium.ttf
  String get poppinsMedium => 'assets/fonts/Poppins-Medium.ttf';

  /// File path: assets/fonts/Poppins-Regular.ttf
  String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';

  /// File path: assets/fonts/Poppins-SemiBold.ttf
  String get poppinsSemiBold => 'assets/fonts/Poppins-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    cairoMedium,
    cairoRegular,
    cairoSemiBold,
    poppinsMedium,
    poppinsRegular,
    poppinsSemiBold,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/app_icon_foreground.png
  AssetGenImage get appIconForeground =>
      const AssetGenImage('assets/images/app_icon_foreground.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// File path: assets/images/world.png
  AssetGenImage get world => const AssetGenImage('assets/images/world.png');

  /// File path: assets/images/world2.png
  AssetGenImage get world2 => const AssetGenImage('assets/images/world2.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appIcon,
    appIconForeground,
    logo,
    welcome,
    world,
    world2,
  ];
}

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/category.svg
  String get category => 'assets/vectors/category.svg';

  /// File path: assets/vectors/down_arrow.svg
  String get downArrow => 'assets/vectors/down_arrow.svg';

  /// File path: assets/vectors/language.svg
  String get language => 'assets/vectors/language.svg';

  /// File path: assets/vectors/pressure.svg
  String get pressure => 'assets/vectors/pressure.svg';

  /// File path: assets/vectors/search.svg
  String get search => 'assets/vectors/search.svg';

  /// File path: assets/vectors/wind.svg
  String get wind => 'assets/vectors/wind.svg';

  /// List of all assets
  List<String> get values => [
    category,
    downArrow,
    language,
    pressure,
    search,
    wind,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
