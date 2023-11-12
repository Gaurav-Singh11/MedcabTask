import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';

class TopRatedManpowerWidget extends StatelessWidget {
  const TopRatedManpowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: AppStyles.screenHorizontalPadding,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: i_2,
        crossAxisSpacing: d_10,
        mainAxisSpacing: d_10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return _manpowerCategoryItemWidget();
      },
    );
  }

  Widget _manpowerCategoryItemWidget() {
    return Container(
      decoration: AppStyles.radiusBoxDecoration(
        color: AppColors.white,
        radius: d_10,
        borderColor: AppColors.lightGray2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: AppStyles.radiusBoxDecoration(
                color: AppColors.lightGray2,
                radius: d_8,
                borderColor: AppColors.lightGray2,
              ),
            ),
          ),
          Padding(
            padding: AppStyles.pd10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 13,
                        ),
                      ),
                      TextSpan(
                        text: "4.5",
                        style: AppStyles.mediumTextStyle(
                          color: AppColors.black,
                          fontSize: 10,
                        ),
                      ),
                      TextSpan(
                        text: " (1233 ${AppLocalizations.current.reviews})",
                        style: AppStyles.regularTextStyle(
                          color: AppColors.black.withOpacity(0.3),
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                AppStyles.sbHeight5,
                PoppinsSemiBoldText(
                  text: AppLocalizations.current.paediatricNurse,
                  fontSize: d_10,
                  maxLines: i_1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                AppStyles.sbHeight5,
                PoppinsRegularText(
                  text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  fontSize: d_9,
                  height: onePointTwo,
                  textAlign: TextAlign.start,
                  color: AppColors.black.withOpacity(0.4),
                ),
                AppStyles.sbHeight15,
                InkWell(
                  onTap: (){},
                  child: Container(
                    decoration:AppStyles.radiusBoxDecoration(
                      radius: 10,
                      borderColor: AppColors.main,
                    ),
                    padding: AppStyles.pd10,
                    alignment: Alignment.center,
                    child: PoppinsMediumText(
                      fontSize: 10,
                      text: AppLocalizations.current.addToCart,
                      color: AppColors.main,
                      height: onePointFive,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
