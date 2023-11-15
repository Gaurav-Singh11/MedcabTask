import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';

class ApiExceptionWidget extends StatelessWidget {
  final String? error;
  final void Function() retry;

  const ApiExceptionWidget({super.key, this.error, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.pdH30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PoppinsMediumText(
            text: error?.trim() ?? AppLocalizations.current.somethingWentWrong,
            fontSize: d_12,
            textAlign: TextAlign.center,
            color: Colors.red,
            height: onePointFive,
          ),
          AppStyles.sbHeight15,
          ElevatedButton(
            onPressed: retry,
            child: PoppinsSemiBoldText(
              text: AppLocalizations.current.tryAgain,
              fontSize: 12,
              height: onePointFive,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
