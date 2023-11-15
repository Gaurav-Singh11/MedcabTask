import 'package:medcab_task/src/business_layer/localization/english_text.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  static late AppLocalizations current;
  static late Locale locale;

  /// Private constructor to initialize the localization with a given locale.
  AppLocalizations._(Locale appLocale) {
    current = this;
  }

  /// Load the localization with a specified [appLocale].
  /// Returns a [Future] of [AppLocalizations] with the specified locale.
  static Future<AppLocalizations> load(Locale appLocale) {
    locale = appLocale;
    return Future.value(AppLocalizations._(appLocale));
  }

  /// Localizations are usually accessed using the [InheritedWidget] "of" syntax.
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Map of values for supported languages.
  static final Map<String, Map<String, String>> _localizedValues = {
    /// English text
    "en": EnglishText.text,
  };

  ///Getters of all keys of supported language map
  String get title => _localizedValues[locale.languageCode]?['title'] ?? "";

  String get apiExceptionMessage => _localizedValues[locale.languageCode]?['api_exception'] ?? "";

  String get timeoutExceptionMessage => _localizedValues[locale.languageCode]?['timeout_exception'] ?? "";

  String get socketExceptionMessage => _localizedValues[locale.languageCode]?['socket_exception'] ?? "";

  String get parseExceptionMessage => _localizedValues[locale.languageCode]?['parse_exception'] ?? "";

  String get requestCancelled => _localizedValues[locale.languageCode]?['request_cancelled'] ?? "";

  String get tryAgain => _localizedValues[locale.languageCode]?['try_again'] ?? "";

  String get somethingWentWrong => _localizedValues[locale.languageCode]?['something_went_wrong'] ?? "";

  String get bookManpower => _localizedValues[locale.languageCode]?['book_manpower'] ?? "";

  String get searchNursesNearBy => _localizedValues[locale.languageCode]?['search_nurses_near_by'] ?? "";

  String get searchManpower => _localizedValues[locale.languageCode]?['search_manpower'] ?? "";

  String get callExpert => _localizedValues[locale.languageCode]?['call_expert'] ?? "";

  String get whatsapp => _localizedValues[locale.languageCode]?['whatsapp'] ?? "";

  String get history => _localizedValues[locale.languageCode]?['history'] ?? "";

  String get viewAll => _localizedValues[locale.languageCode]?['view_all'] ?? "";

  String get bookManpowerByCategory => _localizedValues[locale.languageCode]?['book_manpower_by_category'] ?? "";

  String get checkMedcabHealthCardBenefits => _localizedValues[locale.languageCode]?['check_medcab_health_card_benefits'] ?? "";

  String get paediatricNurse => _localizedValues[locale.languageCode]?['paediatric_nurse'] ?? "";

  String get popularCategories => _localizedValues[locale.languageCode]?['popular_categories'] ?? "";

  String get topRatedManpower => _localizedValues[locale.languageCode]?['top_rated_manpower'] ?? "";

  String get reviews => _localizedValues[locale.languageCode]?['reviews'] ?? "";

  String get addToCart => _localizedValues[locale.languageCode]?['add_to_cart'] ?? "";

  String get processOfManpowerBooking => _localizedValues[locale.languageCode]?['process_of_manpower_booking'] ?? "";

  String get chooseTest => _localizedValues[locale.languageCode]?['choose_test'] ?? "";

  String get addThePatient => _localizedValues[locale.languageCode]?['add_the_patient'] ?? "";

  String get providePersonalInfo => _localizedValues[locale.languageCode]?['provide_personal_info'] ?? "";

  String get bookASlot => _localizedValues[locale.languageCode]?['book_a_slot'] ?? "";

  String get payForTheTest => _localizedValues[locale.languageCode]?['pay_for_the_test'] ?? "";

  String get faqs => _localizedValues[locale.languageCode]?['faqs'] ?? "";

  String get paymentModeFaqForManpower => _localizedValues[locale.languageCode]?['payment_mode_faq_for_manpower'] ?? "";

  String get bookingHistoryFaq => _localizedValues[locale.languageCode]?['booking_history_faq'] ?? "";

  String get paymentModeFaqForBookingTest => _localizedValues[locale.languageCode]?['payment_mode_faq_for_booking_test'] ?? "";

  String get getReportsFaq => _localizedValues[locale.languageCode]?['get_reports_faq'] ?? "";

  String get weEnsureCustomersLeaveTitle => _localizedValues[locale.languageCode]?['we_ensure_customers_leave_title'] ?? "";

  String get weEnsureCustomersLeaveDesc => _localizedValues[locale.languageCode]?['we_ensure_customers_leave_desc'] ?? "";
}