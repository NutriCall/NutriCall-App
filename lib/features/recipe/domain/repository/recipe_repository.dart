import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/detail_recipe_model.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_recipe_model.dart';

abstract class RecipeRepository {
  Future<Either<String, List<ListRecipeModel>>> getListRecipe();
  Future<Either<String, DetailRecipeModel>> getDetailRecipe(
      {required int recipeId});
}
