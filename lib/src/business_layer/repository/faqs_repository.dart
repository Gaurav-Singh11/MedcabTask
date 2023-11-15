import 'dart:convert';

import 'package:medcab_task/src/business_layer/network/api_constants.dart';
import 'package:medcab_task/src/business_layer/network/app_network.dart';
import 'package:medcab_task/src/business_layer/network/exception_type.dart';
import 'package:medcab_task/src/business_layer/network/http_request_methods.dart';
import 'package:medcab_task/src/business_layer/util/helper/log_helper.dart';
import 'package:medcab_task/src/data_layer/models/base_api_response_model.dart';
import 'package:medcab_task/src/data_layer/models/response_models/faqs_response_model.dart';

/// The [FaqsRepository] class handles frequently asked questions for our app.
class FaqsRepository {
  /// Private constructor for singleton
  FaqsRepository._privateConstructor();

  /// Singleton instance creation
  static final _instance = FaqsRepository._privateConstructor();

  /// Get the singleton instance
  static FaqsRepository get instance => _instance;

  /// A private tag used for logging within the [FaqsRepository] class.
  final String _tag = "FaqsRepository: ";

  /// This method utilizes the FAQs API to retrieve and parse response data.
  ///
  /// It initiates a request to the FAQs API using the [AppNetwork] class,
  /// specifying the URL and request type as HTTP GET. The response is then
  /// handled and returned as a [Future] of [ApiResponseModel].
  ///
  /// If the request is successful, the parsed response data of type
  /// [FaqsResponseModel] is encapsulated in the [ApiResponseModel]. In case
  /// of an exception, the [ApiResponseModel] includes the type of exception.
  ///
  /// Returns: A [Future] of [ApiResponseModel] representing the API response.
  Future<ApiResponseModel> faqs() async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstants.faqs,
        requestType: HttpRequestMethods.get,
      );
      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        final responseBody = jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        return ApiResponseModel<FaqsResponseModel>.fromJson(responseBody!, (data) {
          return FaqsResponseModel.fromJson(data);
        });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }
}
