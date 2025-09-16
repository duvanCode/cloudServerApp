


import 'package:equatable/equatable.dart';

class Response extends Equatable {
  final bool success;
  final String message;
  final dynamic data;
  
  Response({required this.success, required this.message, required this.data});
  
  @override
  List<Object> get props => [success, message, data];
}