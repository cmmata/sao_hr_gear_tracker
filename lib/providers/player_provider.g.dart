// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerHash() => r'b78026057ed80e55831ab14cc0c2e89d18fdf8eb';

/// See also [player].
@ProviderFor(player)
final playerProvider = AutoDisposeStreamProvider<Player>.internal(
  player,
  name: r'playerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlayerRef = AutoDisposeStreamProviderRef<Player>;
String _$playerControllerHash() => r'991f1c94ad05e858586c0a99e6dbe574c00c5c6b';

/// See also [PlayerController].
@ProviderFor(PlayerController)
final playerControllerProvider =
    AutoDisposeAsyncNotifierProvider<PlayerController, void>.internal(
  PlayerController.new,
  name: r'playerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
