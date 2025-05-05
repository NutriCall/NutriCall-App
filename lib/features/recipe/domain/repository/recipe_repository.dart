import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/recipe/controllers/add_meal_recipe_controllers.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/detail_recipe_model.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_recipe_model.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_ingredients_model.dart';
import 'package:nutri_call_app/features/recipe/controllers/post_add_ingredients_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/calculate_ingredients_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/submit_recipe_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/delete_ingredient_controller.dart';

abstract class RecipeRepository {
  Future<Either<String, List<ListRecipeModel>>> getListRecipe();
  Future<Either<String, DetailRecipeModel>> getDetailRecipe(
      {required int recipeId});
  Future<Either<String, List<dynamic>>> postAddMealRecipe({
    required RecipeParams params,
  });
  Future<Either<String, Map<String, dynamic>>> postSubmitRecipe({
    required RecipeSubmitParams params,
  });
  Future<Either<String, List<ListIngredientsModel>>> getIngredients({
    required String type,
  });
  Future<Either<String, List<dynamic>>> deleteIngredient({
    required int ingredientId,
  });
  Future<Either<String, Map<String, dynamic>>> postAddIngredients({
    required IngredientsParams params,
  });
  Future<Either<String, Map<String, dynamic>>> postCalculateIngredients({
    required CalculateIngredientsParams params,
  });
}
