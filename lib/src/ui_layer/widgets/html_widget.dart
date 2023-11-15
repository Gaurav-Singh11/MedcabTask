import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/font_families.dart';

class HtmlHelperWidget extends StatelessWidget {
  final String? description;

  const HtmlHelperWidget({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: description,
      style: {
        "#": Style(
          fontFamily: FontFamilies.poppins,
          color: AppColors.black,
          fontSize: FontSize(20),
          fontWeight: FontWeight.w600,
          whiteSpace: WhiteSpace.normal,
          lineHeight: LineHeight.number(1.2),
          padding: HtmlPaddings.zero,
          textAlign: TextAlign.start,
          margin: Margins.zero,
        ),
      },
    );
  }
}
