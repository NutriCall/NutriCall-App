import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/plan/data/plan_repository_impl.dart';

part 'post_temporary_controller.g.dart';

@Riverpod(keepAlive: true)
class PostTemporaryNotifier extends _$PostTemporaryNotifier {
  bool _isFetching = false;

  @override
  FutureOr<Map<String, dynamic>?> build() => null;

  Future<void> post({
    required PostTemporaryParams params,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    if (_isFetching) return;
    _isFetching = true;
    state = const AsyncLoading();

    final repository = ref.watch(planRepositoryProvider);
    final result = await repository.postTemporary(params: params);

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

class PostTemporaryParams {
  final String compositionId;
  final String type;

  PostTemporaryParams({
    required this.compositionId,
    required this.type,
  });
}
