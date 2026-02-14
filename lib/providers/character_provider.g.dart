// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(characters)
const charactersProvider = CharactersProvider._();

final class CharactersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Character>>,
          List<Character>,
          Stream<List<Character>>
        >
    with $FutureModifier<List<Character>>, $StreamProvider<List<Character>> {
  const CharactersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'charactersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

  @override
  String debugGetCreateSourceHash() => _$characterHash();

  @override
  String toString() {
    return r'characterProvider'
        ''
        '($argument)';
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

String _$characterHash() => r'535d77c10c1b83de1264fe1246c5183485f62d7b';

final class CharacterFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Character?>, int> {
  const CharacterFamily._()
    : super(
        retry: null,
        name: r'characterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
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

String _$characterControllerHash() =>
    r'c31604e4c7c384fd6e65a75f0d443d860d9863e9';

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
