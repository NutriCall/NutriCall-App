import 'package:nutri_call_app/features/auth/pages/data/register_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_register_controllers.g.dart';

@Riverpod(keepAlive: true)
class PostRegisterNotifier extends _$PostRegisterNotifier {
  @override
  FutureOr<Map<String, dynamic>?> build() {
    return null;
  }

  Future<void> fetch({
    required RegisterParams params,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(registerRepositoryProvider);

    final result = await repository.postRegister(params: params);
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        onFailed(error);
        print('Error: $error');
      },
      (data) {
        state = AsyncData(data);
        onSuccess(data);
      },
    );
  }
}

class RegisterParams {
  final String fullName;
  final String username;
  final String password;
  final int age;
  final int height;
  final int weight;
  final int weightTarget;
  final double bmi;
  final String fa;
  final String gender;

  RegisterParams({
    required this.fullName,
    required this.username,
    required this.password,
    required this.age,
    required this.height,
    required this.weight,
    required this.weightTarget,
    required this.bmi,
    required this.fa,
    required this.gender,
  });
}
