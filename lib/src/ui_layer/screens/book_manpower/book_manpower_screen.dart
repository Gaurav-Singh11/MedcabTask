import 'package:flutter/material.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/images.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/actions_row_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/app_bar_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/divider_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/frequently_asked_questions_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/headline_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/healthcard_benefit_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/hepato_protector_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/manpower_by_category_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/popular_categories_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/process_of_manpower_booking_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/top_rated_manpower_widget.dart';
import 'package:medcab_task/src/ui_layer/widgets/app-text_fields.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';
import 'package:medcab_task/src/ui_layer/widgets/asset_image_widget.dart';

class BookManpowerScreen extends StatefulWidget {
  const BookManpowerScreen({super.key});

  @override
  State<BookManpowerScreen> createState() => _BookManpowerScreenState();
}

class _BookManpowerScreenState extends State<BookManpowerScreen> {
  final _searchController = TextEditingController();
  BookManpowerBloc? _hepatoProtectorBloc;
  BookManpowerBloc? _faqsBloc;
  BookManpowerBloc? _healthCardBenefitBloc;

  @override
  void initState() {
    super.initState();
    _faqsBloc = BookManpowerBloc();
    _faqsBloc?.updateFaqsExpandedIndex(-1);
    _healthCardBenefitBloc = BookManpowerBloc();
    _healthCardBenefitBloc?.updateHealthCardBenefitPage(0);
    _hepatoProtectorBloc = BookManpowerBloc();
    _hepatoProtectorBloc?.updateHepatoProtectorPage(0);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _healthCardBenefitBloc = null;
    _faqsBloc = null;
    _hepatoProtectorBloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AppBarWidget(),
            Expanded(
              child: _mainBodyWidget(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          AppStyles.sbHeight15,
          _searchManpowerWidget(context),
          AppStyles.sbHeight20,
          HepatoProtectorWidget(bloc: _hepatoProtectorBloc),
          AppStyles.sbHeight15,
          const HorizontalDividerWidget(),
          const ActionsRowWidget(),
          const HorizontalDividerWidget(),
          AppStyles.sbHeight10,
          HeadlineWidget(
            title: AppLocalizations.current.bookManpowerByCategory,
            shouldShowViewAll: true,
          ),
          AppStyles.sbHeight15,
          const ManPowerByCategoryWidget(),
          AppStyles.sbHeight20,
          const HealthCardBenefitWidget(),
          AppStyles.sbHeight15,
          HeadlineWidget(title: AppLocalizations.current.popularCategories),
          AppStyles.sbHeight15,
          const PopularCategoriesWidget(),
          AppStyles.sbHeight15,
          const HorizontalDividerWidget(height: d_6),
          AppStyles.sbHeight15,
          HeadlineWidget(title: AppLocalizations.current.topRatedManpower),
          AppStyles.sbHeight15,
          const TopRatedManpowerWidget(),
          AppStyles.sbHeight15,
          const HorizontalDividerWidget(height: d_8),
          AppStyles.sbHeight15,
          HealthCardBenefitCarouselWidget(bloc: _healthCardBenefitBloc),
          AppStyles.sbHeight15,
          const HorizontalDividerWidget(),
          AppStyles.sbHeight15,
          HeadlineWidget(
              title: AppLocalizations.current.processOfManpowerBooking),
          AppStyles.sbHeight15,
          const ProcessOfManpowerBookingWidget(),
          AppStyles.sbHeight5,
          const HorizontalDividerWidget(),
          AppStyles.sbHeight20,
          HeadlineWidget(title: AppLocalizations.current.faqs),
          AppStyles.sbHeight20,
          FrequentlyAskedQuestionsWidget(bloc: _faqsBloc),
          AppStyles.sbHeight15,
          const HorizontalDividerWidget(height: d_7),
          AppStyles.sbHeight15,
          Row(
            children: [
              Expanded(
                child: HeadlineWidget(
                    title:
                        AppLocalizations.current.weEnsureCustomersLeaveTitle),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: SvgImageWidget(
                  name: AppImages.smileyEmoji,
                  fit: BoxFit.contain,
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
          AppStyles.sbHeight15,
          _profileWidget(),
          AppStyles.sbHeight30,
        ],
      ),
    );
  }

  Widget _searchManpowerWidget(BuildContext context) {
    return Padding(
      padding: AppStyles.screenHorizontalPadding,
      child: CommonTextField(
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.lightGray,
          size: 25,
        ),
        controller: _searchController,
        hint: AppLocalizations.current.searchManpower,
      ),
    );
  }

  Widget _profileWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: AppStyles.getHeight(100),
          width: AppStyles.getWidth(100),
          decoration: AppStyles.circleBoxDecoration(
            color: AppColors.lightPink,
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.person, size: 50),
        ),
        AppStyles.sbHeight3,
        const PoppinsSemiBoldText(
          text: "Saurabh Rajpoot",
          fontSize: 15,
          textAlign: TextAlign.center,
          height: onePointFive,
        ),
        const PoppinsRegularText(
          text: "Lucknow",
          fontSize: 10,
          textAlign: TextAlign.center,
          height: onePointFive,
        ),
        Padding(
          padding: AppStyles.pdH30V10,
          child: PoppinsRegularText(
            text: AppLocalizations.current.weEnsureCustomersLeaveDesc,
            fontSize: 10,
            textAlign: TextAlign.center,
            height: onePointFive,
          ),
        ),
      ],
    );
  }
}
