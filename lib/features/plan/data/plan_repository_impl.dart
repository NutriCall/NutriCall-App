import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/plan/domain/entities/list_composition_model.dart';
import 'package:nutri_call_app/features/plan/domain/repository/plan_repository.dart';
import 'package:nutri_call_app/features/plan/domain/entities/meal_plan_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plan_repository_impl.g.dart';

@riverpod
PlanRepository planRepository(PlanRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return PlanRepositoryImpl(httpClient: httpClient);
}

class PlanRepositoryImpl implements PlanRepository {
  final Dio httpClient;

  PlanRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, List<ListCompositionModel>>> getCompositions({
    required String namaBahan,
  }) async {
    try {
      final response = await httpClient.get(
        '/compositions/search',
        queryParameters: {'nama_bahan': namaBahan},
      );
      if (response.statusCode == 200) {
        final compositionData = response.data['data'];
        if (compositionData is List) {
          final compositionList = compositionData;
          return Right(compositionList
              .map((e) =>
                  ListCompositionModel.fromJson(e as Map<String, dynamic>))
              .toList());
        } else {
          return const Left('Unexpected data format');
        }
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
  Future<Either<String, List<MealPlanModel>>> getMealPlan() async {
    try {
      final response = await httpClient.get('/meals');
      if (response.statusCode == 200) {
        final mealPlanList = (response.data['data'] as List)
            .map((e) => MealPlanModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(mealPlanList);
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
