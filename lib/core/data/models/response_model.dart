import 'package:cloudserver/core/domain/entities/response.dart';

class ResponseModel extends Response {

  @override
  final bool success;
  @override
  final String message;
  @override
  final dynamic data;

  const ResponseModel({
    required this.success,
    required this.message,
    required this.data,
  }) : super(success: success, message: message, data: data);

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }
}