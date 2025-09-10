
import 'package:cloudserver/features/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess({required this.user});
  
  @override
  List<Object> get props => [user];
}

class AuthError extends AuthState {
  final String message;
  
  AuthError({required this.message});
  
  @override
  List<Object> get props => [message];
}