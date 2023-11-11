import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';

class ManPowerByCategoryWidget extends StatelessWidget {
  const ManPowerByCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppStyles.screenHorizontalPadding,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: i_3,
        crossAxisSpacing: d_10,
        mainAxisSpacing: d_10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return _manpowerCategoryItemWidget();
      },
    );
  }

  Widget _manpowerCategoryItemWidget() {
    return Container(
      decoration: AppStyles.appBoxDecoration(
        color: AppColors.white,
        radius: d_10,
        borderColor: AppColors.lightGray2,
      ),
      padding: AppStyles.pd5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: AppStyles.appBoxDecoration(
                color: AppColors.lightOrange.withOpacity(0.4),
                radius: d_8,
                borderColor: AppColors.lightGray2,
              ),
            ),
          ),
          AppStyles.sbHeight10,
          PoppinsRegularText(
            text: AppLocalizations.current.paediatricNurse,
            fontSize: d_9,
            maxLines: i_1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
