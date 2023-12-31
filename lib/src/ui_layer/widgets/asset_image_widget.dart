import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetImageWidget extends StatelessWidget {
  final String name;
  final BoxFit fit;
  final double width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;

  const AssetImageWidget({
    super.key,
    this.name = "",
    this.fit = BoxFit.contain,
    this.width = double.infinity,
    this.height,
    this.color,
    this.colorBlendMode,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      fit: fit,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
      repeat: repeat,
    );
  }
}

class SvgImageWidget extends StatelessWidget {
  final String name;
  final BoxFit fit;
  final double width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;

  const SvgImageWidget({
    super.key,
    this.name = "",
    this.fit = BoxFit.contain,
    this.width = double.infinity,
    this.height,
    this.color,
    this.colorBlendMode,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
    );
  }
}
