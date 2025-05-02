import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_calories_report_model.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_macros_report_model.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_graph_calories_model.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_resume_report_model.dart';
import 'package:nutri_call_app/features/weekly_report/domain/repository/weekly_report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weekly_report_repository_impl.g.dart';

@riverpod
WeeklyReportRepository weeklyReportRepository(WeeklyReportRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return WeeklyReportRepositoryImpl(httpClient: httpClient);
}

class WeeklyReportRepositoryImpl implements WeeklyReportRepository {
  final Dio httpClient;

  WeeklyReportRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, WeeklyCaloriesReportModel>>
      getWeeklyCaloriesReport() async {
    try {
      final response = await httpClient.get('weekly-report/calories');

      if (response.statusCode == 200) {
        WeeklyCaloriesReportModel model =
            WeeklyCaloriesReportModel.fromJson(response.data['data']);
        return Right(model);
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
  Future<Either<String, WeeklyMacrosReportModel>>
      getWeeklyMacrosReport() async {
    try {
      final response = await httpClient.get('weekly-report/eaten');

      if (response.statusCode == 200) {
        WeeklyMacrosReportModel model =
            WeeklyMacrosReportModel.fromJson(response.data['data']);
        return Right(model);
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
  Future<Either<String, WeeklyMacrosReportModel>> getWeeklyMacrosReportByDate(
      String date) async {
    try {
      final response = await httpClient.get('weekly-report/eaten/$date');

      if (response.statusCode == 200) {
        WeeklyMacrosReportModel model =
            WeeklyMacrosReportModel.fromJson(response.data['data']);
        return Right(model);
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
  Future<Either<String, WeeklyGraphCaloriesModel>>
      getWeeklyGraphCaloriesReport() async {
    try {
      final response = await httpClient.get('weekly-report/graph-calories');

      if (response.statusCode == 200) {
        WeeklyGraphCaloriesModel model =
            WeeklyGraphCaloriesModel.fromJson(response.data['data']);
        return Right(model);
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
  Future<Either<String, WeeklyResumeReportModel>>
      getWeeklyResumeReport() async {
    try {
      final response = await httpClient.get('weekly-report/resume');

      if (response.statusCode == 200) {
        WeeklyResumeReportModel model =
            WeeklyResumeReportModel.fromJson(response.data['data']);
        return Right(model);
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
