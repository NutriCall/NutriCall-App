import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/plan/controllers/post_add_meals_controller.dart';
import 'package:nutri_call_app/features/plan/controllers/post_calculate_nutrients_controller.dart';
import 'package:nutri_call_app/features/plan/controllers/post_temporary_controller.dart';
import 'package:nutri_call_app/features/plan/domain/entities/list_composition_model.dart';
import 'package:nutri_call_app/features/plan/domain/entities/temporary_meal_model.dart';
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

  @override
  Future<Either<String, Map<String, dynamic>>> postCalculateNutrients({
    required CalculateNutrientParams params,
  }) async {
    final formData =
        FormData.fromMap({'nama_bahan': params.namaBahan, 'size': params.size});

    try {
      final response = await httpClient
          .post('/compositions/calculate-nutrients', data: formData);

      if (response.statusCode == 200) {
        return Right(response.data['data']);
      } else {
        return Left('Error ${response.statusCode}');
      }
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? 'Unexpected error');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> postTemporary({
    required PostTemporaryParams params,
  }) async {
    try {
      final response = await httpClient.post(
        '/temporary/create',
        data: FormData.fromMap({
          'composition_id': params.compositionId,
          'type': params.type,
        }),
      );

      if (response.statusCode == 200) {
        return Right(response.data['data']);
      } else {
        return Left('Error ${response.statusCode}');
      }
    } on DioException catch (e) {
      return Left(e.response?.data["message"] ?? 'Unexpected error');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TemporaryMealModel>>> getTemporaryMeals({
    required String type,
  }) async {
    try {
      final response = await httpClient.get(
        '/temporary',
        queryParameters: {'type': type},
      );

      if (response.statusCode == 200) {
        final temporaryList = (response.data['data'] as List)
            .map((e) => TemporaryMealModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(temporaryList);
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
  Future<Either<String, List<dynamic>>> postAddMeals({
    required AddMealsParams params,
  }) async {
    final data = {
      'compositions': params.compositions,
      'type': params.type,
    };

    try {
      final response = await httpClient.post(
        '/meals/add',
        data: data,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        return Right(response.data['data']);
      } else {
        return Left('Failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      return Left('${e.response?.data["message"] ?? e.message}');
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
