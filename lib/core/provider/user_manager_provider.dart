import 'dart:convert';

import 'package:nutri_call_app/core/domain/entities/user_model.dart';
import 'package:nutri_call_app/core/provider/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_manager_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<UserManager> userManager(UserManagerRef ref) async {
  final sharedPreferences = await ref.watch(sharedPreferenceProvider.future);
  return UserManager(sharedPreferences: sharedPreferences);
}

@riverpod
FutureOr<UserModel> getCurrentUser(GetCurrentUserRef ref) async {
  final userManager = await ref.watch(userManagerProvider.future);
  final user = await userManager.getUser();
  if (user != null) {
    return user;
  } else {
    throw Exception('User not found');
  }
}

class UserManager {
  final SharedPreferences sharedPreferences;

  UserManager({required this.sharedPreferences});

  Future<void> saveUser(UserModel user) async {
    final userJson = user.toJson();
    final userString = jsonEncode(userJson);

    await sharedPreferences.setString('user', userString);
  }

  Future<UserModel?> getUser() async {
    final userString = sharedPreferences.getString('user');
    if (userString != null) {
      final userJson = jsonDecode(userString);
      return UserModel.fromJson(userJson);
    } else {
      return null;
    }
  }

  Future<void> removeUser() async {
    await sharedPreferences.remove('user');
  }

  Future<bool> hasUser() async {
    final user = await getUser();
    return user != null;
  }
}
