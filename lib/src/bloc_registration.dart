import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/faqs/faqs_bloc.dart';

class RegisterBlocs {
  RegisterBlocs._privateConstructor();

  static List<BlocProvider> blocs(BuildContext context) => [
        BlocProvider<BookManpowerBloc>(
          create: (context) => BookManpowerBloc(),
        ),
        BlocProvider<FaqsBloc>(
          create: (context) => FaqsBloc(),
        ),
      ];
}
