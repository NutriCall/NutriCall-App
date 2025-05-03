import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/detail_recipe_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_recipe_controllers.g.dart';

@Riverpod(keepAlive: true)
class FetchDetailRecipeNotifier extends _$FetchDetailRecipeNotifier {
  @override
  FutureOr<DetailRecipeModel?> build() {
    return null;
  }

  Future<void> fetch({
    required int recipeId,
    Function? onSuccess,
    Function? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(recipeRepositoryProvider);
    final result = await repository.getDetailRecipe(recipeId: recipeId);
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
      (data) {
        state = AsyncData(data);
        onSuccess!();
      },
    );
  }
}
