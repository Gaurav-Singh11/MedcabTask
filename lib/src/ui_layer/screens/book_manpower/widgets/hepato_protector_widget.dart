import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_state.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';
import 'package:medcab_task/src/data_layer/res/images.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/asset_image_widget.dart';

class HepatoProtectorWidget extends StatefulWidget {
  const HepatoProtectorWidget({super.key});

  @override
  State<HepatoProtectorWidget> createState() => _HepatoProtectorWidgetState();
}

class _HepatoProtectorWidgetState extends State<HepatoProtectorWidget> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: AppImages.hepatoProtectors.length,
          itemBuilder: (context, index, page) {
            return Padding(
              padding: AppStyles.pdH20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AssetImageWidget(
                  fit: BoxFit.cover,
                  name: AppImages.hepatoProtectors[index],
                ),
              ),
            );
          },
          options: CarouselOptions(
            disableCenter: true,
            viewportFraction: 1,
            enlargeCenterPage: false,
            autoPlay: true,
            reverse: false,
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              context.read<BookManpowerBloc>().updateHepatoProtectorPage(index);
            },
          ),
        ),
        _buildDots(),
      ],
    );
  }

  Widget _buildDots() {
    return Positioned(
      bottom: 15,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          AppImages.hepatoProtectors.length,
          (index) {
            return BlocBuilder<BookManpowerBloc, BookManpowerState>(
              builder: (context, state) {
                if (state is HepatoProtectorPageState) {
                  return Container(
                    width: AppStyles.getHeight(20),
                    height: AppStyles.getWidth(20),
                    margin: AppStyles.pdH5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.page == index ? AppColors.blueGrey: AppColors.white,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
