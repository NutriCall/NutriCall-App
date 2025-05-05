import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/recipe/data/recipe_repository_impl.dart';

part 'submit_recipe_controller.g.dart';

@Riverpod(keepAlive: true)
class SubmitRecipeController extends _$SubmitRecipeController {
  bool _isSubmitting = false;

  @override
  FutureOr<void> build() {}

  Future<void> submit({
    required RecipeSubmitParams params,
    required Function(Map<String, dynamic> data) onSuccess,
    required Function(String error) onFailed,
  }) async {
    if (_isSubmitting) return;
    print(params.ingredients);
    _isSubmitting = true;

    state = const AsyncLoading();

    final repository = ref.watch(recipeRepositoryProvider);
    final result = await repository.postSubmitRecipe(params: params);

    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onFailed(error);
      },
      (data) {
        state = const AsyncData(null);
        onSuccess(data);
      },
    );

    _isSubmitting = false;
  }
}

class RecipeSubmitParams {
  final String title;
  final List<int> ingredients;
  final List<String> steps;
  final File image;

  RecipeSubmitParams({
    required this.title,
    required this.ingredients,
    required this.steps,
    required this.image,
  });
}
