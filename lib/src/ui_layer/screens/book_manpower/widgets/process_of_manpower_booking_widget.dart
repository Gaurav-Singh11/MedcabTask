import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/ui_layer/widgets/stepper_widget.dart';

class ProcessOfManpowerBookingWidget extends StatelessWidget {
  const ProcessOfManpowerBookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StepperWidget(
      type: StepperWidgetType.vertical,
      physics: const NeverScrollableScrollPhysics(),
      // currentStep: 0,
      steps: [
        StepperStep(
          title: Text(AppLocalizations.current.chooseTest),
        ),
        StepperStep(
          title: Text(AppLocalizations.current.addThePatient),
        ),
        StepperStep(
          title: Text(AppLocalizations.current.providePersonalInfo),
        ),
        StepperStep(
          title: Text(AppLocalizations.current.bookASlot),
        ),
        StepperStep(
          title: Text(AppLocalizations.current.payForTheTest),
        ),
      ],
    );
  }
}
