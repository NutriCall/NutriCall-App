import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/plan/data/plan_repository_impl.dart';

part 'post_calculate_nutrients_controller.g.dart';

@Riverpod(keepAlive: true)
class PostCalculateNutrientsNotifier extends _$PostCalculateNutrientsNotifier {
  bool _isFetching = false;

  @override
  FutureOr<Map<String, dynamic>?> build() => null;

  Future<void> fetch({
    required CalculateNutrientParams params,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    if (_isFetching) return;
    _isFetching = true;

    state = const AsyncLoading();

    final repository = ref.watch(planRepositoryProvider);

    final result = await repository.postCalculateNutrients(params: params);

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

class CalculateNutrientParams {
  final String namaBahan;
  final double size;

  CalculateNutrientParams({
    required this.namaBahan,
    required this.size,
  });
}
