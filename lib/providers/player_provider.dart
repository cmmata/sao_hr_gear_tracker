import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/player.dart';
import 'database_provider.dart';

part 'player_provider.g.dart';

@riverpod
Stream<Player> player(Ref ref) async* {
  final isar = await ref.watch(isarProvider.future);

  yield* isar.players
      .watchObject(0, fireImmediately: true)
      .map((p) => p ?? (Player()..id = 0));
}

@riverpod
class PlayerController extends _$PlayerController {
  @override
  FutureOr<void> build() {}

  Future<void> updatePlayer(Player player) async {
    final isar = await ref.read(isarProvider.future);
    await isar.writeTxn(() async {
      await isar.players.put(player..id = 0);
    });
  }
}
