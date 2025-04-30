import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/core/data/datasources/authentication_remote_datasource.dart/authentication_remote_datasource.dart';
import 'package:nutri_call_app/core/domain/entities/user_model.dart';
import 'package:nutri_call_app/core/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, UserModel>> getUser() async {
    try {
      final response = await remoteDataSource.getUser();
      return response.fold(
        (error) => Left(error),
        (right) => Right(right),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try {
      final response = await remoteDataSource.logout();
      return response.fold(
        (error) => Left(error),
        (right) => Right(right),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> login(
      {required String username, required String password}) async {
    try {
      final response =
          await remoteDataSource.login(username: username, password: password);
      return response.fold(
        (error) => Left(error),
        (right) => Right(right),
      );
    } catch (e) {
      return Left(
        e.toString(),
      );
    }
  }
}
