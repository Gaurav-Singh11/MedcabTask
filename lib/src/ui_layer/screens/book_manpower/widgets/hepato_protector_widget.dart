import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medcab_task/src/data_layer/res/images.dart';
import 'package:medcab_task/src/data_layer/res/styles.dart';
import 'package:medcab_task/src/ui_layer/widgets/asset_image_widget.dart';

class HepatoProtectorWidget extends StatefulWidget {
  const HepatoProtectorWidget({super.key});

  @override
  State<HepatoProtectorWidget> createState() => _HepatoProtectorWidgetState();
}

class _HepatoProtectorWidgetState extends State<HepatoProtectorWidget> {
  int _currentPage = 0;

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
          itemBuilder: (context, index, page) => Padding(
            padding: AppStyles.pdH20,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AssetImageWidget(
                  fit: BoxFit.cover,
                  name: AppImages.hepatoProtectors[index],
                ),
              ),
            ),
          ),
          options: CarouselOptions(
            disableCenter: true,
            viewportFraction: 1,
            enlargeCenterPage: false,
            autoPlay: true,
            reverse: false,
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              setState(() => _currentPage = index);
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
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.blue : Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
