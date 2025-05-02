import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/progress/domain/entities/nutrition_progress_model.dart';
import 'package:nutri_call_app/features/progress/domain/entities/weight_progress_model.dart';
import 'package:nutri_call_app/features/progress/domain/repository/progress_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_repository_impl.g.dart';

@riverpod
ProgressRepository progressRepository(ProgressRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return ProgressRepositoryImpl(httpClient: httpClient);
}

class ProgressRepositoryImpl implements ProgressRepository {
  final Dio httpClient;

  ProgressRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, NutritionProgressModel>> getNutritionProgress() async {
    try {
      final response = await httpClient.get('progress/nutritions');

      if (response.statusCode == 200) {
        NutritionProgressModel nutritionProgressModel =
            NutritionProgressModel.fromJson(response.data['data']);
        return Right(nutritionProgressModel);
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
  Future<Either<String, WeightProgressModel>> getWeightProgress() async {
    try {
      final response = await httpClient.get('progress/weight');

      if (response.statusCode == 200) {
        WeightProgressModel weightProgressModel =
            WeightProgressModel.fromJson(response.data['data']);
        return Right(weightProgressModel);
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
