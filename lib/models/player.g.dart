// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerCollection on Isar {
  IsarCollection<Player> get players => this.collection();
}

const PlayerSchema = CollectionSchema(
  name: r'Player',
  id: -1052842935974721688,
  properties: {
    r'armor': PropertySchema(
      id: 0,
      name: r'armor',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'axe': PropertySchema(
      id: 1,
      name: r'axe',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'boots': PropertySchema(
      id: 2,
      name: r'boots',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'dagger': PropertySchema(
      id: 3,
      name: r'dagger',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'earrings': PropertySchema(
      id: 4,
      name: r'earrings',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'helmet': PropertySchema(
      id: 5,
      name: r'helmet',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'katana': PropertySchema(
      id: 6,
      name: r'katana',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'mace': PropertySchema(
      id: 7,
      name: r'mace',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'rapier': PropertySchema(
      id: 8,
      name: r'rapier',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'scimitar': PropertySchema(
      id: 9,
      name: r'scimitar',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'shield': PropertySchema(
      id: 10,
      name: r'shield',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'spear': PropertySchema(
      id: 11,
      name: r'spear',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'sword': PropertySchema(
      id: 12,
      name: r'sword',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'twoHandedSword': PropertySchema(
      id: 13,
      name: r'twoHandedSword',
      type: IsarType.object,

      target: r'Weapon',
    ),
  },

  estimateSize: _playerEstimateSize,
  serialize: _playerSerialize,
  deserialize: _playerDeserialize,
  deserializeProp: _playerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Weapon': WeaponSchema, r'Gear': GearSchema},

  getId: _playerGetId,
  getLinks: _playerGetLinks,
  attach: _playerAttach,
  version: '3.3.0',
);

int _playerEstimateSize(
  Player object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 + GearSchema.estimateSize(object.armor, allOffsets[Gear]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(object.axe, allOffsets[Weapon]!, allOffsets);
  bytesCount +=
      3 + GearSchema.estimateSize(object.boots, allOffsets[Gear]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(object.dagger, allOffsets[Weapon]!, allOffsets);
  bytesCount +=
      3 +
      GearSchema.estimateSize(object.earrings, allOffsets[Gear]!, allOffsets);
  bytesCount +=
      3 + GearSchema.estimateSize(object.helmet, allOffsets[Gear]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(object.katana, allOffsets[Weapon]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(object.mace, allOffsets[Weapon]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(object.rapier, allOffsets[Weapon]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(
        object.scimitar,
        allOffsets[Weapon]!,
        allOffsets,
      );
  bytesCount +=
      3 + GearSchema.estimateSize(object.shield, allOffsets[Gear]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(object.spear, allOffsets[Weapon]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(object.sword, allOffsets[Weapon]!, allOffsets);
  bytesCount +=
      3 +
      WeaponSchema.estimateSize(
        object.twoHandedSword,
        allOffsets[Weapon]!,
        allOffsets,
      );
  return bytesCount;
}

void _playerSerialize(
  Player object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Gear>(
    offsets[0],
    allOffsets,
    GearSchema.serialize,
    object.armor,
  );
  writer.writeObject<Weapon>(
    offsets[1],
    allOffsets,
    WeaponSchema.serialize,
    object.axe,
  );
  writer.writeObject<Gear>(
    offsets[2],
    allOffsets,
    GearSchema.serialize,
    object.boots,
  );
  writer.writeObject<Weapon>(
    offsets[3],
    allOffsets,
    WeaponSchema.serialize,
    object.dagger,
  );
  writer.writeObject<Gear>(
    offsets[4],
    allOffsets,
    GearSchema.serialize,
    object.earrings,
  );
  writer.writeObject<Gear>(
    offsets[5],
    allOffsets,
    GearSchema.serialize,
    object.helmet,
  );
  writer.writeObject<Weapon>(
    offsets[6],
    allOffsets,
    WeaponSchema.serialize,
    object.katana,
  );
  writer.writeObject<Weapon>(
    offsets[7],
    allOffsets,
    WeaponSchema.serialize,
    object.mace,
  );
  writer.writeObject<Weapon>(
    offsets[8],
    allOffsets,
    WeaponSchema.serialize,
    object.rapier,
  );
  writer.writeObject<Weapon>(
    offsets[9],
    allOffsets,
    WeaponSchema.serialize,
    object.scimitar,
  );
  writer.writeObject<Gear>(
    offsets[10],
    allOffsets,
    GearSchema.serialize,
    object.shield,
  );
  writer.writeObject<Weapon>(
    offsets[11],
    allOffsets,
    WeaponSchema.serialize,
    object.spear,
  );
  writer.writeObject<Weapon>(
    offsets[12],
    allOffsets,
    WeaponSchema.serialize,
    object.sword,
  );
  writer.writeObject<Weapon>(
    offsets[13],
    allOffsets,
    WeaponSchema.serialize,
    object.twoHandedSword,
  );
}

Player _playerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Player();
  object.armor =
      reader.readObjectOrNull<Gear>(
        offsets[0],
        GearSchema.deserialize,
        allOffsets,
      ) ??
      Gear();
  object.axe =
      reader.readObjectOrNull<Weapon>(
        offsets[1],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.boots =
      reader.readObjectOrNull<Gear>(
        offsets[2],
        GearSchema.deserialize,
        allOffsets,
      ) ??
      Gear();
  object.dagger =
      reader.readObjectOrNull<Weapon>(
        offsets[3],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.earrings =
      reader.readObjectOrNull<Gear>(
        offsets[4],
        GearSchema.deserialize,
        allOffsets,
      ) ??
      Gear();
  object.helmet =
      reader.readObjectOrNull<Gear>(
        offsets[5],
        GearSchema.deserialize,
        allOffsets,
      ) ??
      Gear();
  object.id = id;
  object.katana =
      reader.readObjectOrNull<Weapon>(
        offsets[6],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.mace =
      reader.readObjectOrNull<Weapon>(
        offsets[7],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.rapier =
      reader.readObjectOrNull<Weapon>(
        offsets[8],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.scimitar =
      reader.readObjectOrNull<Weapon>(
        offsets[9],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.shield =
      reader.readObjectOrNull<Gear>(
        offsets[10],
        GearSchema.deserialize,
        allOffsets,
      ) ??
      Gear();
  object.spear =
      reader.readObjectOrNull<Weapon>(
        offsets[11],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.sword =
      reader.readObjectOrNull<Weapon>(
        offsets[12],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  object.twoHandedSword =
      reader.readObjectOrNull<Weapon>(
        offsets[13],
        WeaponSchema.deserialize,
        allOffsets,
      ) ??
      Weapon();
  return object;
}

P _playerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Gear>(
                offset,
                GearSchema.deserialize,
                allOffsets,
              ) ??
              Gear())
          as P;
    case 1:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 2:
      return (reader.readObjectOrNull<Gear>(
                offset,
                GearSchema.deserialize,
                allOffsets,
              ) ??
              Gear())
          as P;
    case 3:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 4:
      return (reader.readObjectOrNull<Gear>(
                offset,
                GearSchema.deserialize,
                allOffsets,
              ) ??
              Gear())
          as P;
    case 5:
      return (reader.readObjectOrNull<Gear>(
                offset,
                GearSchema.deserialize,
                allOffsets,
              ) ??
              Gear())
          as P;
    case 6:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 7:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 8:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 9:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 10:
      return (reader.readObjectOrNull<Gear>(
                offset,
                GearSchema.deserialize,
                allOffsets,
              ) ??
              Gear())
          as P;
    case 11:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 12:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    case 13:
      return (reader.readObjectOrNull<Weapon>(
                offset,
                WeaponSchema.deserialize,
                allOffsets,
              ) ??
              Weapon())
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playerGetId(Player object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playerGetLinks(Player object) {
  return [];
}

void _playerAttach(IsarCollection<dynamic> col, Id id, Player object) {
  object.id = id;
}

extension PlayerQueryWhereSort on QueryBuilder<Player, Player, QWhere> {
  QueryBuilder<Player, Player, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlayerQueryWhere on QueryBuilder<Player, Player, QWhereClause> {
  QueryBuilder<Player, Player, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PlayerQueryFilter on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PlayerQueryObject on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> armor(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'armor');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> axe(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'axe');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> boots(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'boots');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> dagger(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dagger');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> earrings(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'earrings');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> helmet(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'helmet');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> katana(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'katana');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> mace(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'mace');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> rapier(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'rapier');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> scimitar(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'scimitar');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> shield(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'shield');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> spear(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'spear');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> sword(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sword');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> twoHandedSword(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'twoHandedSword');
    });
  }
}

extension PlayerQueryLinks on QueryBuilder<Player, Player, QFilterCondition> {}

extension PlayerQuerySortBy on QueryBuilder<Player, Player, QSortBy> {}

extension PlayerQuerySortThenBy on QueryBuilder<Player, Player, QSortThenBy> {
  QueryBuilder<Player, Player, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension PlayerQueryWhereDistinct on QueryBuilder<Player, Player, QDistinct> {}

extension PlayerQueryProperty on QueryBuilder<Player, Player, QQueryProperty> {
  QueryBuilder<Player, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Player, Gear, QQueryOperations> armorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'armor');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> axeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'axe');
    });
  }

  QueryBuilder<Player, Gear, QQueryOperations> bootsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boots');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> daggerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dagger');
    });
  }

  QueryBuilder<Player, Gear, QQueryOperations> earringsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'earrings');
    });
  }

  QueryBuilder<Player, Gear, QQueryOperations> helmetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'helmet');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> katanaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'katana');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> maceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mace');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> rapierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rapier');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> scimitarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scimitar');
    });
  }

  QueryBuilder<Player, Gear, QQueryOperations> shieldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shield');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> spearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spear');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> swordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sword');
    });
  }

  QueryBuilder<Player, Weapon, QQueryOperations> twoHandedSwordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twoHandedSword');
    });
  }
}
