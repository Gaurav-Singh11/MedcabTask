import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_state.dart';

/// The [BookManpowerBloc] class extends [Cubit<BookManpowerState>] and is responsible for
/// managing the state of the user-related data in the application.
class BookManpowerBloc extends Cubit<BookManpowerState> {
  /// Initializes the FaqsBloc with an initial state of [InitialState].
  BookManpowerBloc() : super(InitialState());

  void updateHepatoProtectorPage(int currentPage) async {
    emit(HepatoProtectorPageState(page: currentPage));
  }

  void updateHealthCardBenefitPage(int currentPage) async {
    emit(HealthCardBenefitPageState(page: currentPage));
  }

  void updateFaqsExpandedIndex(int currentIndex) async {
    emit(FaqsExpandedState(index: currentIndex));
  }
}
