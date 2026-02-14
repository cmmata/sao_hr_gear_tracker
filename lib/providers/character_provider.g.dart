// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(characters)
final charactersProvider = AutoDisposeStreamProvider<List<Character>>.internal(
  characters,
  name: r'charactersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$charactersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CharactersRef = AutoDisposeStreamProviderRef<List<Character>>;
String _$characterHash() => r'535d77c10c1b83de1264fe1246c5183485f62d7b';

  @override
  String debugGetCreateSourceHash() => _$charactersHash();

  @$internal
  @override
  $StreamProviderElement<List<Character>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Character>> create(Ref ref) {
    return characters(ref);
  }
}

String _$charactersHash() => r'ab448c538426087a9dc86aaf5736d821e59934d6';

@ProviderFor(character)
const characterProvider = CharacterFamily._();

final class CharacterProvider
    extends
        $FunctionalProvider<
          AsyncValue<Character?>,
          Character?,
          Stream<Character?>
        >
    with $FutureModifier<Character?>, $StreamProvider<Character?> {
  const CharacterProvider._({
    required CharacterFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'characterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  /// See also [character].
  CharacterProvider call(
    int id,
  ) {
    return CharacterProvider(
      id,
    );
  }

  @override
  CharacterProvider getProviderOverride(
    covariant CharacterProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  @$internal
  @override
  $StreamProviderElement<Character?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Character?> create(Ref ref) {
    final argument = this.argument as int;
    return character(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

/// See also [character].
class CharacterProvider extends AutoDisposeStreamProvider<Character?> {
  /// See also [character].
  CharacterProvider(
    int id,
  ) : this._internal(
          (ref) => character(
            ref as CharacterRef,
            id,
          ),
          from: characterProvider,
          name: r'characterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$characterHash,
          dependencies: CharacterFamily._dependencies,
          allTransitiveDependencies: CharacterFamily._allTransitiveDependencies,
          id: id,
        );

  CharacterProvider call(int id) =>
      CharacterProvider._(argument: id, from: this);

  @override
  String toString() => r'characterProvider';
}

@ProviderFor(CharacterController)
const characterControllerProvider = CharacterControllerProvider._();

final class CharacterControllerProvider
    extends $AsyncNotifierProvider<CharacterController, void> {
  const CharacterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'characterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$characterControllerHash();

  @$internal
  @override
  CharacterController create() => CharacterController();
}

mixin CharacterRef on AutoDisposeStreamProviderRef<Character?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CharacterProviderElement
    extends AutoDisposeStreamProviderElement<Character?> with CharacterRef {
  _CharacterProviderElement(super.provider);

abstract class _$CharacterController extends $AsyncNotifier<void> {
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

String _$characterControllerHash() =>
    r'c31604e4c7c384fd6e65a75f0d443d860d9863e9';

/// See also [CharacterController].
@ProviderFor(CharacterController)
final characterControllerProvider =
    AutoDisposeAsyncNotifierProvider<CharacterController, void>.internal(
  CharacterController.new,
  name: r'characterControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$characterControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CharacterController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
