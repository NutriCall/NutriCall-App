import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/weekly_report/data/weekly_report_repository_impl.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_macros_report_model.dart';

part 'weekly_macros_report_controller.g.dart';

@Riverpod(keepAlive: true)
class FetchWeeklyMacrosReportNotifier
    extends _$FetchWeeklyMacrosReportNotifier {
  @override
  Future<Either<String, WeeklyMacrosReportModel>> build() async {
    final repository = ref.watch(weeklyReportRepositoryProvider);
    return await repository.getWeeklyMacrosReport();
  }

  Future<void> fetch({
    Function()? onSuccess,
    Function(String error)? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(weeklyReportRepositoryProvider);
    final result = await repository.getWeeklyMacrosReport();
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
