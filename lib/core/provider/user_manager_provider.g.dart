// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userManagerHash() => r'7f2188ebf453deb826d8d0bd3886ebee73f02582';

/// See also [userManager].
@ProviderFor(userManager)
final userManagerProvider = FutureProvider<UserManager>.internal(
  userManager,
  name: r'userManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserManagerRef = FutureProviderRef<UserManager>;
String _$getCurrentUserHash() => r'f380164541b12d1b3d4c16591561d13fbc13205e';

/// See also [getCurrentUser].
@ProviderFor(getCurrentUser)
final getCurrentUserProvider = AutoDisposeFutureProvider<UserModel>.internal(
  getCurrentUser,
  name: r'getCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentUserRef = AutoDisposeFutureProviderRef<UserModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
