import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_state.dart';
import 'package:medcab_task/src/business_layer/blocs/faqs/faqs_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/faqs/faqs_state.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';
import 'package:medcab_task/src/data_layer/models/response_models/faqs_response_model.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/font_families.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';
import 'package:medcab_task/src/ui_layer/widgets/error_widgets.dart';
import 'package:medcab_task/src/ui_layer/widgets/progress_helper.dart';

class FrequentlyAskedQuestionsWidget extends StatelessWidget {
  final BookManpowerBloc? bloc;

  const FrequentlyAskedQuestionsWidget({super.key, this.bloc});

  @override
  Widget build(BuildContext context) {
    if (bloc == null) return const SizedBox.shrink();
    return BlocBuilder<FaqsBloc, FaqsState>(
      builder: (context, state) {
        if (state is FetchingFaqs) {
          return Padding(
            padding: AppStyles.pd20,
            child: const ProgressBar(),
          );
        } else if (state is FaqsFetched &&
            state.faqsResponseModel.faqList != null) {
          return ListView.separated(
            padding: AppStyles.screenHorizontalPadding,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _faqs(state.faqsResponseModel.faqList![index], index);
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 2, thickness: 1);
            },
            itemCount: state.faqsResponseModel.faqList!.length,
          );
        } else if (state is FaqsFetchingFailed) {
          return ApiExceptionWidget(
            error: state.failureMessage,
            retry: () => context.read<FaqsBloc>().fetchFaqs(),
          );
        } else {
          return ApiExceptionWidget(
            error: AppLocalizations.current.somethingWentWrong,
            retry: () => context.read<FaqsBloc>().fetchFaqs(),
          );
        }
      },
    );
  }

  Widget _faqs(FaqList faqList, int index) {
    return BlocBuilder<BookManpowerBloc, BookManpowerState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is FaqsExpandedState) {
          return Column(
            children: [
              InkWell(
                onTap: () => _handleTap(state, index),
                child: Padding(
                  padding: AppStyles.pdV5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Html(
                          data: faqList.header ?? "",
                          style: {
                            "#": Style(
                              fontFamily: FontFamilies.poppins,
                              color: AppColors.black,
                              fontSize: FontSize(10),
                              fontWeight: FontWeight.w600,
                              whiteSpace: WhiteSpace.normal,
                              lineHeight: LineHeight.number(1.2),
                              padding: HtmlPaddings.zero,
                              textAlign: TextAlign.start,
                              margin: Margins.zero,
                            ),
                          },
                        ), /*PoppinsMediumText(
                            text: faqList.header ?? "",
                            fontSize: d_10,
                            height: onePointFive,
                          ),*/
                      ),
                      Icon(
                        state.index == index
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      )
                    ],
                  ),
                ),
              ),
              if (state.index == index)
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: PoppinsRegularText(
                    text: faqList.description ?? "",
                    fontSize: 9,
                    height: onePointFive,
                    color: AppColors.black.withOpacity(0.4),
                  ),
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _handleTap(FaqsExpandedState state, int index) {
    if (state.index == index) {
      bloc?.updateFaqsExpandedIndex(-1);
    } else {
      bloc?.updateFaqsExpandedIndex(index);
    }
  }
}
