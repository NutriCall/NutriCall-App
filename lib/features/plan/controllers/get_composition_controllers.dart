import 'package:nutri_call_app/features/plan/data/plan_repository_impl.dart';
import 'package:nutri_call_app/features/plan/domain/entities/list_composition_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_composition_controllers.g.dart';

@Riverpod(keepAlive: true)
class FetchCompositionControllers extends _$FetchCompositionControllers {
  @override
  Future<List<ListCompositionModel>?> build() async {
    return null;
  }

  Future<void> fetch({
    required String namaBahan,
  }) async {
    try {
      final repository = ref.read(planRepositoryProvider);

      final result = await repository.getCompositions(
        namaBahan: namaBahan,
      );

      result.fold(
        (error) {
          state = AsyncError(error, StackTrace.current);
        },
        (data) {
          state = AsyncData(data as List<ListCompositionModel>?);
        },
      );
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  void clear() {
    state = const AsyncData([]);
  }
}
