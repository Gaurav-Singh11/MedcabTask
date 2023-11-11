import 'package:flutter/material.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';

class HorizontalDividerWidget extends StatelessWidget {
  const HorizontalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      color: AppColors.fadeWhite,
    );
  }
}

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 20,
      color: AppColors.black.withOpacity(0.5),
    );
  }
}
