// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(player)
const playerProvider = PlayerProvider._();

final class PlayerProvider
    extends $FunctionalProvider<AsyncValue<Player>, Player, Stream<Player>>
    with $FutureModifier<Player>, $StreamProvider<Player> {
  const PlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerHash();

  @$internal
  @override
  $StreamProviderElement<Player> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Player> create(Ref ref) {
    return player(ref);
  }
}

String _$playerHash() => r'f8354649daea689e809270bec721e8bc504a2474';

@ProviderFor(PlayerController)
const playerControllerProvider = PlayerControllerProvider._();

final class PlayerControllerProvider
    extends $AsyncNotifierProvider<PlayerController, void> {
  const PlayerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerControllerHash();

  @$internal
  @override
  PlayerController create() => PlayerController();
}

String _$playerControllerHash() => r'4e8720e53e26b20ba6bc3654a822849862d0e6b5';

abstract class _$PlayerController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
