import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_meal_recipe_controllers.g.dart';

@Riverpod(keepAlive: true)
class PostMealRecipeNotifier extends _$PostMealRecipeNotifier {
  @override
  FutureOr<List<dynamic>?> build() {
    return null;
  }

  Future<void> fetch({
    required RecipeParams params,
    required Function(List<dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(recipeRepositoryProvider);

    final result = await repository.postAddMealRecipe(params: params);
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onFailed(error);
        print('Error: $error');
      },
      (data) {
        state = AsyncData(data);
        onSuccess(data);
      },
    );
  }
}

class RecipeParams {
  final List<int> compositions;
  final String type;

  RecipeParams({
    required this.compositions,
    required this.type,
  });
}
