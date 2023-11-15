import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/faqs/faqs_state.dart';
import 'package:medcab_task/src/business_layer/repository/faqs_repository.dart';
import 'package:medcab_task/src/business_layer/util/helper/util_helper.dart';
import 'package:medcab_task/src/data_layer/models/response_models/faqs_response_model.dart';

/// The [FaqsBloc] class extends [Cubit<FaqsState>] and is responsible for
/// managing the state of the faqs-related data in the application.
class FaqsBloc extends Cubit<FaqsState> {
  /// Initializes the FaqsBloc with an initial state of [InitialState].
  FaqsBloc() : super(InitialState());

  /// Asynchronously fetches FAQs data from the repository and updates the state
  /// accordingly. Emits [FetchingFaqs] state while the data is being fetched.
  /// If the fetch is successful, emits [FaqsFetched] state with the fetched data.
  /// If an error occurs during the fetch, emits [FaqsFetchingFailed] state with
  /// an error message.
  Future<void> fetchFaqs() async {
    emit(FetchingFaqs());
    final response = await FaqsRepository.instance.faqs();
    if (response.jsonData != null && response.jsonData is FaqsResponseModel) {
      emit(FaqsFetched(faqsResponseModel: response.jsonData));
    } else {
      emit(FaqsFetchingFailed(failureMessage: UtilHelper.instance.getExceptionMessage(response.exceptionType)));
    }
  }
}
