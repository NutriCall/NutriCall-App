import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutri_call_app/features/report/data/daily_report_repository_impl.dart';
import 'package:nutri_call_app/features/report/domain/entities/nutrient_model.dart';

part 'nutrient_controllers.g.dart';

@Riverpod(keepAlive: true)
class FetchNutrientReportNotifier extends _$FetchNutrientReportNotifier {
  @override
  Future<Either<String, List<NutrientItemModel>>> build() async {
    final repository = ref.watch(dailyReportRepositoryProvider);
    return await repository.getNutrientReport();
  }

  Future<void> fetch({
    Function()? onSuccess,
    Function(String error)? onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(dailyReportRepositoryProvider);
    final result = await repository.getNutrientReport();
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
