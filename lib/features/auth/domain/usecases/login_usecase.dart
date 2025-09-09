

import 'package:cloudserver/core/errors/failures.dart';
import 'package:cloudserver/core/usecases/usecase.dart';
import 'package:cloudserver/features/auth/domain/entities/user.dart';
import 'package:cloudserver/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository repository;
  
  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;
  
  LoginParams({required this.email, required this.password});
  
  @override
  List<Object> get props => [email, password];
}