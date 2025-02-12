/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// List of all assets
  List<SvgGenImage> get values => [back];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bananaSplit.jpg
  AssetGenImage get bananaSplit =>
      const AssetGenImage('assets/images/bananaSplit.jpg');

  /// File path: assets/images/chickenKatsu.jpeg
  AssetGenImage get chickenKatsu =>
      const AssetGenImage('assets/images/chickenKatsu.jpeg');

  /// File path: assets/images/logoApp.PNG
  AssetGenImage get logoApp => const AssetGenImage('assets/images/logoApp.PNG');

  /// File path: assets/images/logoNutri.png
  AssetGenImage get logoNutri =>
      const AssetGenImage('assets/images/logoNutri.png');

  /// File path: assets/images/mountainElement.png
  AssetGenImage get mountainElement =>
      const AssetGenImage('assets/images/mountainElement.png');

  /// File path: assets/images/plan.png
  AssetGenImage get plan => const AssetGenImage('assets/images/plan.png');

  /// File path: assets/images/recipe.png
  AssetGenImage get recipe => const AssetGenImage('assets/images/recipe.png');

  /// File path: assets/images/sopIga.jpg
  AssetGenImage get sopIga => const AssetGenImage('assets/images/sopIga.jpg');

  /// File path: assets/images/userProfile.png
  AssetGenImage get userProfile =>
      const AssetGenImage('assets/images/userProfile.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bananaSplit,
        chickenKatsu,
        logoApp,
        logoNutri,
        mountainElement,
        plan,
        recipe,
        sopIga,
        userProfile
      ];
}

class $AssetsNavbarGen {
  const $AssetsNavbarGen();

  /// File path: assets/navbar/home.svg
  SvgGenImage get home => const SvgGenImage('assets/navbar/home.svg');

  /// File path: assets/navbar/plan.svg
  SvgGenImage get plan => const SvgGenImage('assets/navbar/plan.svg');

  /// File path: assets/navbar/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/navbar/profile.svg');

  /// File path: assets/navbar/progress.svg
  SvgGenImage get progress => const SvgGenImage('assets/navbar/progress.svg');

  /// File path: assets/navbar/report.svg
  SvgGenImage get report => const SvgGenImage('assets/navbar/report.svg');

  /// List of all assets
  List<SvgGenImage> get values => [home, plan, profile, progress, report];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsNavbarGen navbar = $AssetsNavbarGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
