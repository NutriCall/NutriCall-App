import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/plan/domain/entities/meal_plan_model.dart';
import 'package:nutri_call_app/features/plan/data/plan_repository_impl.dart';

part 'meal_plan_controller.g.dart';

@Riverpod(keepAlive: true)
class FetchMealPlanNotifier extends _$FetchMealPlanNotifier {
  @override
  Future<Either<String, List<MealPlanModel>>> build() async {
    final repository = ref.watch(planRepositoryProvider);
    return await repository.getMealPlan();
  }

  Future<void> fetch({
    Function()? onSuccess,
    Function(String error)? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(planRepositoryProvider);
    final result = await repository.getMealPlan();
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
