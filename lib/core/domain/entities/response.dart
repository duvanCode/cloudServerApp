import 'package:equatable/equatable.dart';

abstract class Response extends Equatable {
  final bool success;
  final String message;
  final dynamic data;
  
  const Response({required this.success, required this.message, required this.data});
  
  @override
  List<Object> get props => [success, message, data];
}