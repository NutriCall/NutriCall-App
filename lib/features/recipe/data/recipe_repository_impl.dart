import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/recipe/controllers/add_meal_recipe_controllers.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/detail_recipe_model.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_recipe_model.dart';
import 'package:nutri_call_app/features/recipe/domain/repository/recipe_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_repository_impl.g.dart';

@riverpod
RecipeRepository recipeRepository(RecipeRepositoryRef ref) {
  final httpClient = ref.watch(dioProvider);
  return RecipeRepositoryImpl(httpClient: httpClient);
}

class RecipeRepositoryImpl implements RecipeRepository {
  final Dio httpClient;

  RecipeRepositoryImpl({required this.httpClient});

  @override
  Future<Either<String, List<ListRecipeModel>>> getListRecipe() async {
    try {
      final response = await httpClient.get(
        '/recipes/',
      );
      if (response.statusCode == 200) {
        final recipeData = response.data['data'];
        if (recipeData is List) {
          final recipeList = recipeData;
          return Right(recipeList
              .map((e) => ListRecipeModel.fromJson(e as Map<String, dynamic>))
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
  Future<Either<String, DetailRecipeModel>> getDetailRecipe(
      {required int recipeId}) async {
    try {
      final response = await httpClient.get('/recipes/$recipeId');
      if (response.statusCode == 200) {
        DetailRecipeModel detailRecipeModel =
            DetailRecipeModel.fromJson(response.data['data']);
        return Right(detailRecipeModel);
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
  Future<Either<String, List<dynamic>>> postAddMealRecipe({
    required RecipeParams params,
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
