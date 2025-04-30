import 'package:nutri_call_app/core/controllers/login_provider.dart';
import 'package:nutri_call_app/core/controllers/logout_provider.dart';
import 'package:nutri_call_app/core/controllers/save_user_provider.dart';
import 'package:nutri_call_app/core/domain/usecases/login.dart';
import 'package:nutri_call_app/core/domain/usecases/logout.dart';
import 'package:nutri_call_app/core/provider/token_manageR_provider.dart';
import 'package:nutri_call_app/core/provider/user_manager_provider.dart';
import 'package:nutri_call_app/features/main/controllers/selected_index_provider.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/routers/routers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();

    ref.invalidate(selectedIndexNavBar);
    Login login = await ref.watch(loginProvider);
    final result =
        await login(LoginParams(username: username, password: password));
    result.fold((error) {
      state = AsyncError(error, StackTrace.current);
      state = const AsyncData(null);
    }, (token) async {
      TokenManager tokenManager = await ref.watch(tokenManagerProvider.future);
      await tokenManager.saveToken(token);
      await ref.read(saveUserProvider.future);
      UserManager userManager = await ref.watch(userManagerProvider.future);
      final user = await userManager.hasUser();
      if (user == true) {
        state = const AsyncData('Success');
        ref.read(routerProvider).pushReplacementNamed(RouteName.main);
      } else {
        state = AsyncError('Login Gagal Coba Lagi', StackTrace.current);
        state = const AsyncData(null);
      }
    });
  }

  Future<void> logout(
      {required Function onSuccess, required Function onError}) async {
    state = const AsyncLoading();
    Logout logout = await ref.watch(logoutProvider);
    final result = await logout.call(null);
    result.fold(
      (error) {
        state = AsyncError(error, StackTrace.current);
        state = AsyncData(state.valueOrNull);
        onError();
      },
      (data) async {
        ref.read(tokenManagerProvider).value!.removeToken();
        ref.read(userManagerProvider).value!.removeUser();
        state = const AsyncData('Success');
        onSuccess();
        ref.read(routerProvider).pushReplacementNamed(RouteName.loginPage);
      },
    );
  }
}
