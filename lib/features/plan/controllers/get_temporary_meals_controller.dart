import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutri_call_app/features/plan/data/plan_repository_impl.dart';
import 'package:nutri_call_app/features/plan/domain/entities/temporary_meal_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_temporary_meals_controller.g.dart';

@Riverpod(keepAlive: true)
class FetchTemporaryMealsController extends _$FetchTemporaryMealsController {
  @override
  Future<List<TemporaryMealModel>?> build() async {
    return null;
  }

  Future<void> fetch({required String type}) async {
    try {
      final repository = ref.read(planRepositoryProvider);

      final result = await repository.getTemporaryMeals(type: type);

      result.fold(
        (error) {
          state = AsyncError(error, StackTrace.current);
        },
        (data) {
          state = AsyncData(data);
        },
      );
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  void clear() {
    state = const AsyncData([]);
  }
}
