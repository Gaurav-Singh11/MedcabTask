import 'package:flutter/material.dart';
import 'package:medcab_task/src/data_layer/res/colors.dart';

class BookManpowerScreen extends StatefulWidget {
  const BookManpowerScreen({super.key});

  @override
  State<BookManpowerScreen> createState() => _BookManpowerScreenState();
}

class _BookManpowerScreenState extends State<BookManpowerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: _mainBodyWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainBodyWidget() {
    return const Column(
      children: [],
    );
  }
}
