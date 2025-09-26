import 'package:cloudserver/core/errors/failures.dart';
import 'package:cloudserver/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  //Future<Either<Failure, void>> logout();
  //Future<Either<Failure, bool>> isLoggedIn();
}