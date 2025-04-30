import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/features/profile/data/profile_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'put_profile_controllers.g.dart';

@Riverpod(keepAlive: true)
class PutProfileNotifier extends _$PutProfileNotifier {
  @override
  FutureOr<Map<String, dynamic>?> build() {
    return null;
  }

  Future<void> fetch({
    required ProfileParams params,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(String) onFailed,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(profileRepositoryProvider);

    final result = await repository.putProfile(params: params);
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

class ProfileParams {
  XFile? imageUrl;
  String? fullName;
  String? username;
  int? age;
  int? height;
  int? weight;
  int? weightTarget;
  double? bmi;
  String? fa;
  String? gender;

  ProfileParams({
    this.imageUrl,
    this.fullName,
    this.username,
    this.age,
    this.height,
    this.weight,
    this.weightTarget,
    this.bmi,
    this.fa,
    this.gender,
  });
}
