import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/report/domain/entities/daily_calorie_report_model.dart';
import 'package:nutri_call_app/features/report/domain/entities/food_eaten_report_model.dart';
import 'package:nutri_call_app/features/report/domain/entities/macronutrient_report_model.dart';
import 'package:nutri_call_app/features/report/domain/repository/daily_report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'daily_report_repository_impl.g.dart';

@riverpod
DailyReportRepository dailyReportRepository(DailyReportRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return DailyReportRepositoryImpl(httpClient: httpClient);
}

class DailyReportRepositoryImpl implements DailyReportRepository {
  final Dio httpClient;

  DailyReportRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, DailyCalorieReportModel>>
      getDailyCalorieReport() async {
    try {
      final response = await httpClient.get('daily-report/calories');

      if (response.statusCode == 200) {
        DailyCalorieReportModel model =
            DailyCalorieReportModel.fromJson(response.data['data']);
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
  Future<Either<String, FoodEatenReportModel>> getFoodEatenReport() async {
    try {
      final response = await httpClient.get('daily-report/food-eaten');

      if (response.statusCode == 200) {
        FoodEatenReportModel model =
            FoodEatenReportModel.fromJson(response.data['data']);
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
  Future<Either<String, MacronutrientReportModel>>
      getMacronutrientReport() async {
    try {
      final response = await httpClient.get('daily-report/macro');

      if (response.statusCode == 200) {
        MacronutrientReportModel model =
            MacronutrientReportModel.fromJson(response.data['data']);
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
