import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_state.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/numbers.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/app_text_widgets.dart';

class FrequentlyAskedQuestionsWidget extends StatelessWidget {
  final  BookManpowerBloc? bloc;
  const FrequentlyAskedQuestionsWidget({super.key, this.bloc});

  @override
  Widget build(BuildContext context) {
    if (bloc == null) return const SizedBox.shrink();
    return ListView.separated(
      padding: AppStyles.screenHorizontalPadding,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _faqs(bloc!.faqs[index], index);
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 2, thickness: 1);
      },
      itemCount: bloc!.faqs.length,
    );
  }

  Widget _faqs(String title, int index) {
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
                        child: PoppinsMediumText(
                          text: title,
                          fontSize: d_10,
                        ),
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
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    fontSize: 9,
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
