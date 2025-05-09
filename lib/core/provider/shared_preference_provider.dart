import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<SharedPreferences> sharedPreference(SharedPreferenceRef ref) async {
  return await SharedPreferences.getInstance();
}
