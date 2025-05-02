import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/report/data/daily_report_repository_impl.dart';
import 'package:nutri_call_app/features/report/domain/entities/food_eaten_report_model.dart';

part 'food_eaten_report_controller.g.dart';

@Riverpod(keepAlive: true)
class FetchFoodEatenReportNotifier extends _$FetchFoodEatenReportNotifier {
  @override
  Future<Either<String, FoodEatenReportModel>> build() async {
    final repository = ref.watch(dailyReportRepositoryProvider);
    return await repository.getFoodEatenReport();
  }

  Future<void> fetch({
    Function()? onSuccess,
    Function(String error)? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(dailyReportRepositoryProvider);
    final result = await repository.getFoodEatenReport();
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
