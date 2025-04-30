import 'package:nutri_call_app/core/provider/token_manageR_provider.dart';
import 'package:nutri_call_app/features/home/data/current_user_repository_impl.dart';
import 'package:nutri_call_app/features/home/domain/entities/current_user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_controllers.g.dart';

@riverpod
class FetchCurrentUserNotifier extends _$FetchCurrentUserNotifier {
  @override
  FutureOr<CurrentUserModel?> build() {
    return null;
  }

  Future<void> fetch() async {
    try {
      state = const AsyncLoading();

      final tokenManager = await ref.read(tokenManagerProvider.future);
      final authToken = await tokenManager.getToken();

      if (authToken == null) {
        state = const AsyncData(null);
        return;
      }

      final headers = {
        'Authorization': 'Bearer $authToken',
      };

      final repository = ref.read(currentUserRepositoryProvider);
      final result = await repository.getCurrentUser(headers: headers);

      result.fold(
        (error) {
          state = AsyncError(error, StackTrace.current);
          print('Error fetching user: $error');
        },
        (data) {
          state = AsyncData(data);
          print('Successfully fetched user data: $data');
        },
      );
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      print('Unexpected error: $e');
    }
  }
}
