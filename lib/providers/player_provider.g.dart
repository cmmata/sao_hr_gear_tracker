// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerHash() => r'0bd51202cdea0a427aa488d0097f857e48e0732d';

/// See also [player].
@ProviderFor(player)
final playerProvider = AutoDisposeStreamProvider<Player?>.internal(
  player,
  name: r'playerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlayerRef = AutoDisposeStreamProviderRef<Player?>;
String _$playerControllerHash() => r'59d30e85626fc915a1acb10397aff7d75cc92991';

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
