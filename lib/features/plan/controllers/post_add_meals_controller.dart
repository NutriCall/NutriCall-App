import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/plan/data/plan_repository_impl.dart';

part 'post_add_meals_controller.g.dart';

@Riverpod(keepAlive: true)
class PostAddMealsNotifier extends _$PostAddMealsNotifier {
  @override
  FutureOr<List<dynamic>?> build() {
    return null;
  }

  Future<void> fetch({
    required AddMealsParams params,
    required Function(List<dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(planRepositoryProvider);

    final result = await repository.postAddMeals(params: params);
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

class AddMealsParams {
  final List<int> compositions;
  final String type;

  AddMealsParams({
    required this.compositions,
    required this.type,
  });
}
