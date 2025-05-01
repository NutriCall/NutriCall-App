import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/home/domain/entities/cal_today_model.dart';
import 'package:nutri_call_app/features/home/domain/entities/current_user_model.dart';
import 'package:nutri_call_app/features/home/domain/repository/current_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_repository_impl.g.dart';

@riverpod
CurrentUserRepository currentUserRepository(CurrentUserRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return CurrentUserRepositoryImpl(httpClient: httpClient);
}

class CurrentUserRepositoryImpl implements CurrentUserRepository {
  final Dio httpClient;

  CurrentUserRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, CurrentUserModel>> getCurrentUser({
    required Map<String, String> headers,
  }) async {
    try {
      final response = await httpClient.get(
        'auth/user',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        CurrentUserModel currentUserModel =
            CurrentUserModel.fromJson(response.data['data']);
        return Right(currentUserModel);
      } else {
        return Left('Failed to load data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final error = e.response?.data['message'] ?? 'Unknown error';
      return Left(error);
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, CalTodayModel>> getCalToday() async {
    try {
      final response = await httpClient.get(
        'progress/cal-today',
      );

      if (response.statusCode == 200) {
        CalTodayModel calTodayModel =
            CalTodayModel.fromJson(response.data['data']);
        return Right(calTodayModel);
      } else {
        return Left('Failed to load data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final error = e.response?.data['message'] ?? 'Unknown error';
      return Left(error);
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }
}
