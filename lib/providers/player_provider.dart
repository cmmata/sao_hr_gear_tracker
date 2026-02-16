import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/player.dart';
import 'database_provider.dart';

part 'player_provider.g.dart';

@riverpod
Stream<Player> player(Ref ref) async* {
  final isar = await ref.watch(isarProvider.future);

  // Ensure a player exists with ID 0
  final exists = await isar.players.get(0) != null;
  if (!exists) {
    await isar.writeTxn(() async {
      // Double check inside transaction
      if (await isar.players.get(0) == null) {
        await isar.players.put(Player()..id = 0);
      }
    });
  }

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
