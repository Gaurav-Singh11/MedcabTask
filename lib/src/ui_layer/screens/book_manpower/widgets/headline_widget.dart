import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';

class HeadlineWidget extends StatelessWidget {
  final String title;
  final bool shouldShowViewAll;
  final VoidCallback? onViewAllButtonTap;

  const HeadlineWidget({
    super.key,
    required this.title,
    this.shouldShowViewAll = false,
    this.onViewAllButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.screenHorizontalPadding,
      child: Row(
        children: [
          Expanded(
            child: PoppinsSemiBoldText(
              text: title,
              fontSize: 15,
              height: onePointFive,
            ),
          ),
          if (shouldShowViewAll)
            InkWell(
              onTap: () {},
              child: Padding(
                padding: AppStyles.pdV5,
                child: PoppinsMediumText(
                  text: AppLocalizations.current.viewAll,
                  color: AppColors.main,
                  height: onePointFive,
                  fontSize: 13,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
