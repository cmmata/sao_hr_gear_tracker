import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/player.dart';
import 'database_provider.dart';

part 'player_provider.g.dart';

@riverpod
Stream<Player> player(PlayerRef ref) async* {
  final isar = await ref.watch(isarProvider.future);

  // Ensure a player exists
  final existingPlayer = await isar.players.where().findFirst();
  if (existingPlayer == null) {
    await isar.writeTxn(() async {
      await isar.players.put(Player());
    });
  }

  yield* isar.players.where().watch(fireImmediately: true).map((players) => players.first);
}

@riverpod
class PlayerController extends _$PlayerController {
  @override
  FutureOr<void> build() {}

  Future<void> updatePlayer(Player player) async {
    final isar = await ref.read(isarProvider.future);
    await isar.writeTxn(() async {
      await isar.players.put(player);
    });
  }
}
