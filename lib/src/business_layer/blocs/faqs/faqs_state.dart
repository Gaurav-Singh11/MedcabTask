import 'package:medcab_task/src/data_layer/models/response_models/faqs_response_model.dart';

abstract class FaqsState {}

class InitialState extends FaqsState {}

class FetchingFaqs extends FaqsState {
  FetchingFaqs({this.page = 0});

  final int page;
}

class FaqsFetched extends FaqsState {
  FaqsFetched({required this.faqsResponseModel});

  final FaqsResponseModel faqsResponseModel;
}

class FaqsFetchingFailed extends FaqsState {
  FaqsFetchingFailed({required this.failureMessage});

  final String failureMessage;
}
