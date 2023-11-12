import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_task/src/business_layer/blocs/book_manpower/book_manpower_state.dart';
import 'package:medcab_task/src/business_layer/localization/app_localizations.dart';

/// The [BookManpowerBloc] class extends [Cubit<BookManpowerState>] and is responsible for
/// managing the state of the user-related data in the application.
class BookManpowerBloc extends Cubit<BookManpowerState> {
  /// Initializes the UserBloc with an initial state of [InitialState].
  BookManpowerBloc() : super(InitialState());

  final faqs = [
    AppLocalizations.current.paymentModeFaqForManpower,
    AppLocalizations.current.bookingHistoryFaq,
    AppLocalizations.current.paymentModeFaqForBookingTest,
    AppLocalizations.current.getReportsFaq,
    AppLocalizations.current.paymentModeFaqForBookingTest,
    AppLocalizations.current.getReportsFaq,
    AppLocalizations.current.paymentModeFaqForBookingTest,
    AppLocalizations.current.getReportsFaq,
  ];

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
