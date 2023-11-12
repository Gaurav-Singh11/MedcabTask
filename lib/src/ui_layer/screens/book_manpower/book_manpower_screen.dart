import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/actions_row_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/app_bar_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/divider_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/headline_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/healthcard_benefit_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/hepato_protector_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/manpower_by_category_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/popular_categories_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/process_of_manpower_booking_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/top_rated_manpower_widget.dart';
import 'package:medcab_task/src/ui_layer/widgets/app-text_fields.dart';

class BookManpowerScreen extends StatefulWidget {
  const BookManpowerScreen({super.key});

  @override
  State<BookManpowerScreen> createState() => _BookManpowerScreenState();
}

class _BookManpowerScreenState extends State<BookManpowerScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<BookManpowerBloc>().updateHepatoProtectorPage(0);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
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
          const HepatoProtectorWidget(),
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
          const HealthCardBenefitCarouselWidget(),
          AppStyles.sbHeight15,
          const HorizontalDividerWidget(),
          AppStyles.sbHeight15,
          HeadlineWidget(title: AppLocalizations.current.processOfManpowerBooking),
          AppStyles.sbHeight15,
          const ProcessOfManpowerBookingWidget(),
          AppStyles.sbHeight15,
          AppStyles.sbHeight15,
          AppStyles.sbHeight15,
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
}
