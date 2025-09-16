import 'package:cloudserver/core/errors/failures.dart';
import 'package:cloudserver/features/auth/data/models/response_model.dart';
import 'package:cloudserver/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel>> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await dio.post(
        '/api/login',
        data: {'username': email, 'password': password},
      );

      final ResponseModel responseData = ResponseModel.fromJson(response.data);

      if (!responseData.success) {
        return Left(ServerFailure());
      }
      
      final user = UserModel.fromJson(responseData.data);

      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
