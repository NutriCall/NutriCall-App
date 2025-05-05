import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_add_ingredients_controller.g.dart';

@Riverpod(keepAlive: true)
class PostAddIngredientsController extends _$PostAddIngredientsController {
  bool _isFetching = false;

  @override
  FutureOr<Map<String, dynamic>?> build() => null;

  Future<void> post({
    required IngredientsParams params,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    if (_isFetching) return;
    _isFetching = true;
    state = const AsyncLoading();

    final repository = ref.watch(recipeRepositoryProvider);
    final result = await repository.postAddIngredients(params: params);

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

class IngredientsParams {
  final String compositionId;
  final String type;

  IngredientsParams({
    required this.compositionId,
    required this.type,
  });
}
