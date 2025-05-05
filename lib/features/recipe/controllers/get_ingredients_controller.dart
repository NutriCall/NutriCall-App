import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_call_app/features/recipe/controllers/delete_ingredient_controller.dart';
import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_ingredients_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_ingredients_controller.g.dart';

@Riverpod(keepAlive: true)
class GetIngredientsController extends _$GetIngredientsController {
  @override
  Future<List<ListIngredientsModel>?> build() async {
    return null;
  }

  Future<void> fetch({required String type}) async {
    try {
      final repository = ref.read(recipeRepositoryProvider);

      final result = await repository.getIngredients(type: "Ingredients");

      result.fold(
        (error) {
          state = AsyncError(error, StackTrace.current);
        },
        (data) {
          state = AsyncData(data);
        },
      );
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  void clear() {
    state = const AsyncData([]);
  }
}
