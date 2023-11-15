import 'package:medcab_task/src/business_layer/network/exception_type.dart';

class BaseApiResponseModel {
  BaseApiResponseModel(
      {this.exceptionType = ExceptionType.noException, this.data});

  ExceptionType exceptionType;
  dynamic data;
}

class ApiResponseModel<T> {
  ApiResponseModel({
    this.message,
    this.jsonData,
    this.status,
    this.result,
    this.exceptionType = ExceptionType.noException,
  });

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    return ApiResponseModel<T>(
      message: json['Message'],
      status: json['status'],
      result: json['result'],
      jsonData: create(json['JSONData']),
      exceptionType: ExceptionType.noException,
    );
  }

  String? result;
  String? message;
  String? status;
  T? jsonData;
  ExceptionType exceptionType;
}
