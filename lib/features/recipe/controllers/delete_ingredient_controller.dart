import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_ingredient_controller.g.dart';

@Riverpod(keepAlive: true)
class DeleteIngredientController extends _$DeleteIngredientController {
  bool _isFetching = false;

  @override
  FutureOr<void> build() {}

  Future<void> delete({
    required int id,
    required Function() onSuccess,
    required Function(String error) onFailed,
  }) async {
    if (_isFetching) return;
    _isFetching = true;
    state = const AsyncLoading();

    final repository = ref.watch(recipeRepositoryProvider);
    final result = await repository.deleteIngredient(ingredientId: id);

    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onFailed(error);
      },
      (_) {
        state = const AsyncData(null);
        onSuccess();
      },
    );

    _isFetching = false;
  }
}
