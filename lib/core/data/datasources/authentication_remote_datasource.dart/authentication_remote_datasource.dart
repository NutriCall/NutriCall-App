import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/domain/entities/user_model.dart';
import 'package:nutri_call_app/utils/error/dio_error.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Either<String, String>> login({
    required String username,
    required String password,
  });

  Future<Either<String, String>> logout();
  Future<Either<String, UserModel>> getUser();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Dio httpClient;
  AuthenticationRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<Either<String, String>> login(
      {required String username, required String password}) async {
    try {
      final response = await httpClient.post(
        'auth/login',
        data: FormData.fromMap({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final token = response.data['data']['access_token'];
        return Right(token);
      } else if (response.statusCode == 401) {
        return Left(response.data['message']);
      } else {
        return const Left('Terjadi kesalahan');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        return Left(e.response?.data['message'] ?? 'Internal Server Error');
      } else if (e.response?.statusCode == 400) {
        return Left(e.response?.data['message'] ?? 'Data tidak sesuai');
      } else if (e.response?.statusCode == 404) {
        return Left(e.response?.data['message'] ?? 'Data tidak ditemukan');
      } else {
        return const Left('Error: Username atau password salah');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try {
      final response = await httpClient.post(
        'auth/logout',
      );

      if (response.statusCode == 200) {
        final message = response.data['message'];
        return Right(message);
      } else if (response.statusCode == 401) {
        return Left(response.data['error']);
      } else {
        return const Left('Terjadi kesalahan');
      }
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, UserModel>> getUser() async {
    try {
      final response = await httpClient.get(
        'auth/user',
      );
      if (response.statusCode == 200) {
        final user = response.data['data'];
        return Right(
          UserModel.fromJson(user),
        );
      } else if (response.statusCode == 401) {
        return Left(response.data['error']);
      } else {
        return const Left('Terjadi kesalahan');
      }
    } on DioException catch (e) {
      final error = await DioErrorHandler.handleError(e);
      return Left(error);
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
