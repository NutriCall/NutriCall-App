import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_recipe_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_list_recipe_controllers.g.dart';

@Riverpod(keepAlive: true)
class FetchListRecipeControllers extends _$FetchListRecipeControllers {
  @override
  Future<List<ListRecipeModel>?> build() async {
    return null;
  }

  Future<void> fetch({
    Function? onSuccess,
    Function? onFailed,
  }) async {
    try {
      final repository = ref.read(recipeRepositoryProvider);

      final result = await repository.getListRecipe();

      result.fold(
        (error) {
          state = AsyncError(error, StackTrace.current);
        },
        (data) {
          state = AsyncData(data as List<ListRecipeModel>?);
          onSuccess!();
        },
      );
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}
