import 'package:nutri_call_app/core/controllers/get_user_provider.dart';
import 'package:nutri_call_app/core/domain/usecases/get_user.dart';
import 'package:nutri_call_app/core/provider/user_manager_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_user_provider.g.dart';

@riverpod
FutureOr<void> saveUser(SaveUserRef ref) async {
  GetUser getUser = await ref.watch(getUserProvider);
  final result = await getUser.call(null);
  return result.fold(
    (error) {
      throw error;
    },
    (data) async {
      ref.invalidate(getCurrentUserProvider);
      UserManager user = await ref.watch(userManagerProvider.future);
      await user.saveUser(data);
    },
  );
}
