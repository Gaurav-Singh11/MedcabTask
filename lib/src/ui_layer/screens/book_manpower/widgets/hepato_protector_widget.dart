import 'package:flutter/material.dart';
import 'package:medcab_task/src/data_layer/res/images.dart';

class HepatoProtectorWidget extends StatefulWidget {
  const HepatoProtectorWidget({super.key});

  @override
  State<HepatoProtectorWidget> createState() => _HepatoProtectorWidgetState();
}

class _HepatoProtectorWidgetState extends State<HepatoProtectorWidget> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: AppImages.hepatoProtectorImages.length,
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.amber,
                  ),
                  child: Image.network(
                    AppImages.hepatoProtectorImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10.0),
        _buildDots(),
      ],
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
