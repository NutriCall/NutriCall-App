import 'package:nutri_call_app/features/plan/data/plan_repository_impl.dart';
import 'package:nutri_call_app/features/plan/domain/entities/delete_plan_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_plan_controllers.g.dart';

@Riverpod(keepAlive: true)
class FetchDeletePlanNotifier extends _$FetchDeletePlanNotifier {
  @override
  FutureOr<DeletePlanModel?> build() {
    return null;
  }

  Future<void> fetch({
    required int mealId,
    Function? onSuccess,
    Function? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(planRepositoryProvider);
    final result = await repository.deletePlan(mealId: mealId);
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
