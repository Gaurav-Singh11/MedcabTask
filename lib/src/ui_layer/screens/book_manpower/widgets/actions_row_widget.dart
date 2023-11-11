import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/divider_widget.dart';

class ActionsRowWidget extends StatelessWidget {
  const ActionsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionComponent(
          title: AppLocalizations.current.callExpert,
          icon: const Icon(Icons.call),
          onTap: () {},
        ),
        const VerticalDividerWidget(),
        _actionComponent(
          title: AppLocalizations.current.whatsapp,
          icon: const Icon(
            Icons.chat,
            color: AppColors.main,
          ),
          onTap: () {},
        ),
        const VerticalDividerWidget(),
        _actionComponent(
          title: AppLocalizations.current.history,
          icon: const Icon(
            Icons.history,
            color: AppColors.lightOrange,
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _actionComponent({
    required Widget icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return MaterialButton(
      padding: AppStyles.pd5,
      onPressed: () {},
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: AppStyles.subtitleStyle(),
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: icon,
            ),
            TextSpan(
              text: "  $title",
              style: AppStyles.subtitleStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
