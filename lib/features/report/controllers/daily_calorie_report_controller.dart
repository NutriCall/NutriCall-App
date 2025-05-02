import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/report/data/daily_report_repository_impl.dart';
import 'package:nutri_call_app/features/report/domain/entities/daily_calorie_report_model.dart';

part 'daily_calorie_report_controller.g.dart';

@Riverpod(keepAlive: true)
class FetchDailyCalorieReportNotifier
    extends _$FetchDailyCalorieReportNotifier {
  @override
  Future<Either<String, DailyCalorieReportModel>> build() async {
    final repository = ref.watch(dailyReportRepositoryProvider);
    return await repository.getDailyCalorieReport();
  }

  Future<void> fetch({
    Function()? onSuccess,
    Function(String error)? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(dailyReportRepositoryProvider);
    final result = await repository.getDailyCalorieReport();
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
