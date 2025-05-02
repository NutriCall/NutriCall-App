import 'package:dartz/dartz.dart';
import 'package:nutri_call_app/features/progress/data/progress_repository_impl.dart';
import 'package:nutri_call_app/features/progress/domain/entities/nutrition_progress_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nutrition_progress_controller.g.dart';

@Riverpod(keepAlive: true)
class FetchNutritionProgressNotifier extends _$FetchNutritionProgressNotifier {
  @override
  Future<Either<String, NutritionProgressModel>> build() async {
    final repository = ref.watch(progressRepositoryProvider);
    return await repository.getNutritionProgress();
  }

  Future<void> fetch({
    Function()? onSuccess,
    Function(String error)? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(progressRepositoryProvider);
    final result = await repository.getNutritionProgress();
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        if (onFailed != null) onFailed(error);
      },
      (data) {
        state = AsyncData(result);
        if (onSuccess != null) onSuccess();
      },
    );
  }
}
