

import 'package:cloudserver/core/errors/failures.dart';
import 'package:cloudserver/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cloudserver/features/auth/domain/entities/user.dart';
import 'package:cloudserver/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}