import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_state.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/business_layer/util/helper/device_info_helper.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/images.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';
import 'package:medcab_task/src/ui_layer/widgets/asset_image_widget.dart';

class HealthCardBenefitWidget extends StatelessWidget {
  const HealthCardBenefitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.screenHorizontalPadding,
      width: double.infinity,
      color: AppColors.fadeWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyles.sbHeight30,
          PoppinsSemiBoldText(
            text: AppLocalizations.current.checkMedcabHealthCardBenefits,
            fontSize: 17,
            height: onePointFive,
          ),
          AppStyles.sbHeight25,
          ClipRRect(
            borderRadius: BorderRadius.circular(d_10),
            child: SvgImageWidget(
              height: AppStyles.getHeight(105),
              fit: BoxFit.fitWidth,
              width: DeviceInfo.width,
              name: AppImages.healthCardBenefit,
            ),
          ),
          AppStyles.sbHeight20,
        ],
      ),
    );
  }
}

class HealthCardBenefitCarouselWidget extends StatelessWidget {
  final BookManpowerBloc? bloc;
  const HealthCardBenefitCarouselWidget({super.key, this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppStyles.getHeight(105),
          child: CarouselSlider.builder(
            itemCount: AppImages.hepatoProtectors.length,
            itemBuilder: (context, index, page) {
              return Container(
                padding: AppStyles.pdH20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const SvgImageWidget(
                    fit: BoxFit.fill,
                    name: AppImages.healthCardBenefit,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              disableCenter: true,
              viewportFraction: 1,
              aspectRatio: DeviceInfo.width,
              enlargeCenterPage: false,
              autoPlay: true,
              reverse: false,
              autoPlayCurve: Curves.easeInOut,
              onPageChanged: (index, reason) {
                bloc?.updateHealthCardBenefitPage(index);
              },
            ),
          ),
        ),
        AppStyles.sbHeight10,
        _buildDots(),
      ],
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        AppImages.hepatoProtectors.length,
            (index) {
          return BlocBuilder<BookManpowerBloc, BookManpowerState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is HealthCardBenefitPageState) {
                return Container(
                  width: AppStyles.getHeight(10),
                  height: AppStyles.getWidth(10),
                  margin: AppStyles.pdH5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state.page == index
                        ? AppColors.blueGrey
                        : AppColors.lightGray,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
