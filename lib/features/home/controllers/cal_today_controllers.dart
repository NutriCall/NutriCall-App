import 'package:nutri_call_app/features/home/data/current_user_repository_impl.dart';
import 'package:nutri_call_app/features/home/domain/entities/cal_today_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cal_today_controllers.g.dart';

@Riverpod(keepAlive: true)
class FetchCalTodayNotifier extends _$FetchCalTodayNotifier {
  @override
  Future<CalTodayModel?> build() async {
    return null;
  }

  Future<void> fetch({
    Function? onSuccess,
    Function? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(currentUserRepositoryProvider);
    final result = await repository.getCalToday();
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        if (onFailed != null) onFailed();
      },
      (data) {
        state = AsyncData(data);
        if (onSuccess != null) onSuccess();
      },
    );
  }
}
