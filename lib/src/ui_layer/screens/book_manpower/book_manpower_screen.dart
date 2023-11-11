import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/app_bar_widget.dart';
import 'package:medcab_task/src/ui_layer/screens/book_manpower/widgets/hepato_protector_widget.dart';
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
    return Column(
      children: [
        AppStyles.sbHeight15,
        _searchManpowerWidget(context),
        AppStyles.sbHeight20,
        const HepatoProtectorWidget(),
      ],
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
