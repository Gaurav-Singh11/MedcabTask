import 'package:flutter/material.dart';
import 'package:medcab_task/src/data_layer/res/font_families.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';

class PoppinsRegularText extends StatelessWidget {
  const PoppinsRegularText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = onePointFive,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    this.fontSize = d_14,
    this.maxLines,
    this.useResponsive = true,
  });

  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final int? maxLines;
  final bool useResponsive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: useResponsive ? AppStyles.getFontSize(fontSize) : fontSize,
        fontFamily: FontFamilies.poppins,
        fontWeight: FontWeight.w400,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsMediumText extends StatelessWidget {
  const PoppinsMediumText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    required this.fontSize,
    this.maxLines,
    this.useResponsive = true,
  });

  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final bool useResponsive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: useResponsive ? AppStyles.getFontSize(fontSize) : fontSize,
        fontFamily: FontFamilies.poppins,
        fontWeight: FontWeight.w500,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsSemiBoldText extends StatelessWidget {
  const PoppinsSemiBoldText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    required this.fontSize,
    this.maxLines,
    this.useResponsive = true,
  });

  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final bool useResponsive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: useResponsive ? AppStyles.getFontSize(fontSize) : fontSize,
        fontFamily: FontFamilies.poppins,
        fontWeight: FontWeight.w600,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsSemiBoldSecondText extends StatelessWidget {
  const PoppinsSemiBoldSecondText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    required this.fontSize,
    this.maxLines,
    this.useResponsive = true,
  });

  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final int? maxLines;
  final bool useResponsive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: useResponsive ? AppStyles.getFontSize(fontSize) : fontSize,
        fontFamily: FontFamilies.poppins,
        fontWeight: FontWeight.w700,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsBoldText extends StatelessWidget {
  const PoppinsBoldText({
    super.key,
    required this.text,
    required this.fontSize,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    this.maxLines,
    this.useResponsive = true,
  });

  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final bool useResponsive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: useResponsive ? AppStyles.getFontSize(fontSize) : fontSize,
        fontFamily: FontFamilies.poppins,
        fontWeight: FontWeight.w800,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}

class PoppinsExtraBoldText extends StatelessWidget {
  const PoppinsExtraBoldText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.height = d_1,
    this.color = Colors.white,
    this.overflow,
    this.textDecoration = TextDecoration.none,
    required this.fontSize,
    this.maxLines,
    this.useResponsive = true,
  });

  final int? maxLines;
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final double height;
  final Color color;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;
  final bool useResponsive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: useResponsive ? AppStyles.getFontSize(fontSize) : fontSize,
        fontFamily: FontFamilies.poppins,
        fontWeight: FontWeight.w900,
        height: height,
        decoration: textDecoration,
      ),
    );
  }
}
