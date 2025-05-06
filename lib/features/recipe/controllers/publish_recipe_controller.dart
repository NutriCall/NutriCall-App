import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'publish_recipe_controller.g.dart';

@Riverpod(keepAlive: true)
class PublishRecipeController extends _$PublishRecipeController {
  bool _isFetching = false;

  @override
  FutureOr<Map<String, dynamic>?> build() => null;

  Future<void> publish({
    required String recipeId,
    required Function(Map<String, dynamic>?) onSuccess,
    required Function(String) onFailed,
  }) async {
    if (_isFetching) return;
    _isFetching = true;
    state = const AsyncLoading();

    final repository = ref.watch(recipeRepositoryProvider);
    final result = await repository.publishRecipe(recipeId: recipeId);

    result.fold(
      (err) {
        state = AsyncError(err, StackTrace.current);
        onFailed(err);
      },
      (data) {
        state = AsyncData(data);
        onSuccess(data);
      },
    );

    _isFetching = false;
  }
}
