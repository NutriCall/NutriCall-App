import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calculate_ingredients_controller.g.dart';

@Riverpod(keepAlive: true)
class CalculateIngredientsController extends _$CalculateIngredientsController {
  bool _isFetching = false;

  @override
  FutureOr<Map<String, dynamic>?> build() => null;

  Future<void> fetch({
    required CalculateIngredientsParams params,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    if (_isFetching) return;
    _isFetching = true;

    state = const AsyncLoading();

    final repository = ref.watch(recipeRepositoryProvider);

    final result = await repository.postCalculateIngredients(params: params);

    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onFailed(error);
      },
      (data) {
        state = AsyncData(data);
        onSuccess(data);
      },
    );

    _isFetching = false;
  }
}

class CalculateIngredientsParams {
  final String namaBahan;
  final double size;

  CalculateIngredientsParams({
    required this.namaBahan,
    required this.size,
  });
}
