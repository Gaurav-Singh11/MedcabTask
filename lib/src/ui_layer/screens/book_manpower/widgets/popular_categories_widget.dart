import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';

class PopularCategoriesWidget extends StatelessWidget {
  const PopularCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppStyles.screenHorizontalPadding,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: i_3,
        crossAxisSpacing: d_15,
        mainAxisSpacing: d_15,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return _manpowerCategoryItemWidget();
      },
    );
  }

  Widget _manpowerCategoryItemWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: AppStyles.circleBoxDecoration(
              color: AppColors.lightPink
            ),
          ),
        ),
        AppStyles.sbHeight10,
        PoppinsSemiBoldText(
          text: AppLocalizations.current.paediatricNurse,
          fontSize: d_10,
          maxLines: i_1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
