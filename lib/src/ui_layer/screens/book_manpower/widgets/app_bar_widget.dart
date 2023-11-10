import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppStyles.sbWidth8,
                  IconButton(
                    padding: AppStyles.pd5,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: PoppinsSemiBoldText(
                      text: AppLocalizations.current.bookManpower,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: AppStyles.screenHorizontalPadding,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: AppLocalizations.current.searchNursesNearBy,
                    style: AppStyles.mediumTextStyle(color: AppColors.midGray),
                    children: [
                      TextSpan(
                        text: ' Indra Nagar lucknow',
                        style: AppStyles.mediumTextStyle(
                          color: AppColors.main,
                        ),
                      ),
                      const WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.main,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
