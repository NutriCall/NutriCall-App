import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nutri_call_app/core/provider/dio_provider.dart';
import 'package:nutri_call_app/features/recipe/controllers/add_meal_recipe_controllers.dart';
import 'package:nutri_call_app/features/recipe/controllers/post_add_ingredients_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/calculate_ingredients_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/get_ingredients_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/submit_recipe_controller.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/detail_recipe_model.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_ingredients_model.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_recipe_model.dart';
import 'package:nutri_call_app/features/recipe/domain/repository/recipe_repository.dart';
import 'package:nutri_call_app/features/recipe/controllers/delete_ingredient_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/publish_recipe_controller.dart';
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

  @override
  Future<Either<String, Map<String, dynamic>>> postAddIngredients({
    required IngredientsParams params,
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
  Future<Either<String, Map<String, dynamic>>> postCalculateIngredients({
    required CalculateIngredientsParams params,
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
  Future<Either<String, List<ListIngredientsModel>>> getIngredients({
    required String type,
  }) async {
    try {
      final response = await httpClient.get(
        '/temporary',
        queryParameters: {'type': "Ingredients"},
      );

      if (response.statusCode == 200) {
        final temporaryList = (response.data['data'] as List)
            .map(
                (e) => ListIngredientsModel.fromJson(e as Map<String, dynamic>))
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
  Future<Either<String, Map<String, dynamic>>> postSubmitRecipe({
    required RecipeSubmitParams params,
  }) async {
    try {
      final data = FormData.fromMap({
        'title': params.title,
        'image': await MultipartFile.fromFile(params.image.path,
            filename: params.image.path.split('/').last),
        'ingredients': params.ingredients,
        'steps': params.steps,
      });
      final response = await httpClient.post(
        '/recipes/',
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status != null && status < 400;
          },
        ),
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data['data']);
      } else {
        return Left('Error ${response.statusCode}');
      }
    } on DioException catch (e) {
      return Left(e.response?.statusMessage ?? 'Unexpected error');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<dynamic>>> deleteIngredient({
    required int ingredientId,
  }) async {
    try {
      final response = await httpClient.delete(
        '/temporary/delete/$ingredientId',
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
  Future<Either<String, Map<String, dynamic>?>> publishRecipe({
    required String recipeId,
  }) async {
    try {
      final response = await httpClient.post(
        '/recipes/publish/$recipeId',
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
}
