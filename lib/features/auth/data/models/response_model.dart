import 'package:cloudserver/features/auth/domain/entities/Response.dart';

class ResponseModel extends Response {
  ResponseModel({
    required bool success,
    required String message,
    required dynamic data,
  }) : super(success: success, message: message, data: data);

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}
