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
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: AppImages.hepatoProtectorImages.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: AppStyles.pdH10,
                  child: AssetImageWidget(
                    name: image,
                    fit: BoxFit.contain,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            scrollPhysics: const PageScrollPhysics(),
            // reverse: true,
            // autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            // enlargeFactor: 0.5,
            // viewportFraction: 0.99,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
          ),
        ),
        _buildDots(),
      ],
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(AppImages.hepatoProtectorImages.length, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }
}
