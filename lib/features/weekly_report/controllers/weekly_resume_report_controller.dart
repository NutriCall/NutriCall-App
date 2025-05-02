import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/weekly_report/domain/entities/weekly_resume_report_model.dart';
import 'package:nutri_call_app/features/weekly_report/data/weekly_report_repository_impl.dart';

part 'weekly_resume_report_controller.g.dart';

@Riverpod(keepAlive: true)
class FetchWeeklyResumeReportNotifier
    extends _$FetchWeeklyResumeReportNotifier {
  @override
  Future<Either<String, WeeklyResumeReportModel>> build() async {
    final repository = ref.watch(weeklyReportRepositoryProvider);
    return await repository.getWeeklyResumeReport();
  }

  Future<void> fetch({
    Function()? onSuccess,
    Function(String error)? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(weeklyReportRepositoryProvider);
    final result = await repository.getWeeklyResumeReport();
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
