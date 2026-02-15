// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCharacterCollection on Isar {
  IsarCollection<Character> get characters => this.collection();
}

const CharacterSchema = CollectionSchema(
  name: r'Character',
  id: 4658184409279959047,
  properties: {
    r'affection': PropertySchema(
      id: 0,
      name: r'affection',
      type: IsarType.long,
    ),
    r'armor': PropertySchema(
      id: 1,
      name: r'armor',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'bedtimes': PropertySchema(id: 2, name: r'bedtimes', type: IsarType.long),
    r'boots': PropertySchema(
      id: 3,
      name: r'boots',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'helmet': PropertySchema(
      id: 4,
      name: r'helmet',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'shield': PropertySchema(
      id: 6,
      name: r'shield',
      type: IsarType.object,

      target: r'Gear',
    ),
    r'weapon': PropertySchema(
      id: 7,
      name: r'weapon',
      type: IsarType.object,

      target: r'Weapon',
    ),
    r'weaponType': PropertySchema(
      id: 8,
      name: r'weaponType',
      type: IsarType.byte,
      enumMap: _CharacterweaponTypeEnumValueMap,
    ),
  },

  estimateSize: _characterEstimateSize,
  serialize: _characterSerialize,
  deserialize: _characterDeserialize,
  deserializeProp: _characterDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {r'Weapon': WeaponSchema, r'Gear': GearSchema},

  getId: _characterGetId,
  getLinks: _characterGetLinks,
  attach: _characterAttach,
  version: '3.3.0',
);

int _characterEstimateSize(
  Character object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.armor;
    if (value != null) {
      bytesCount +=
          3 + GearSchema.estimateSize(value, allOffsets[Gear]!, allOffsets);
    }
  }
  {
    final value = object.boots;
    if (value != null) {
      bytesCount +=
          3 + GearSchema.estimateSize(value, allOffsets[Gear]!, allOffsets);
    }
  }
  {
    final value = object.helmet;
    if (value != null) {
      bytesCount +=
          3 + GearSchema.estimateSize(value, allOffsets[Gear]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.shield;
    if (value != null) {
      bytesCount +=
          3 + GearSchema.estimateSize(value, allOffsets[Gear]!, allOffsets);
    }
  }
  {
    final value = object.weapon;
    if (value != null) {
      bytesCount +=
          3 + WeaponSchema.estimateSize(value, allOffsets[Weapon]!, allOffsets);
    }
  }
  return bytesCount;
}

void _characterSerialize(
  Character object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.affection);
  writer.writeObject<Gear>(
    offsets[1],
    allOffsets,
    GearSchema.serialize,
    object.armor,
  );
  writer.writeLong(offsets[2], object.bedtimes);
  writer.writeObject<Gear>(
    offsets[3],
    allOffsets,
    GearSchema.serialize,
    object.boots,
  );
  writer.writeObject<Gear>(
    offsets[4],
    allOffsets,
    GearSchema.serialize,
    object.helmet,
  );
  writer.writeString(offsets[5], object.name);
  writer.writeObject<Gear>(
    offsets[6],
    allOffsets,
    GearSchema.serialize,
    object.shield,
  );
  writer.writeObject<Weapon>(
    offsets[7],
    allOffsets,
    WeaponSchema.serialize,
    object.weapon,
  );
  writer.writeByte(offsets[8], object.weaponType.index);
}

Character _characterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Character();
  object.affection = reader.readLong(offsets[0]);
  object.armor = reader.readObjectOrNull<Gear>(
    offsets[1],
    GearSchema.deserialize,
    allOffsets,
  );
  object.bedtimes = reader.readLong(offsets[2]);
  object.boots = reader.readObjectOrNull<Gear>(
    offsets[3],
    GearSchema.deserialize,
    allOffsets,
  );
  object.helmet = reader.readObjectOrNull<Gear>(
    offsets[4],
    GearSchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.name = reader.readStringOrNull(offsets[5]);
  object.shield = reader.readObjectOrNull<Gear>(
    offsets[6],
    GearSchema.deserialize,
    allOffsets,
  );
  object.weapon = reader.readObjectOrNull<Weapon>(
    offsets[7],
    WeaponSchema.deserialize,
    allOffsets,
  );
  object.weaponType =
      _CharacterweaponTypeValueEnumMap[reader.readByteOrNull(offsets[8])] ??
      WeaponType.sword;
  return object;
}

P _characterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 4:
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 7:
      return (reader.readObjectOrNull<Weapon>(
            offset,
            WeaponSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 8:
      return (_CharacterweaponTypeValueEnumMap[reader.readByteOrNull(offset)] ??
              WeaponType.sword)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CharacterweaponTypeEnumValueMap = {
  'sword': 0,
  'rapier': 1,
  'dagger': 2,
  'mace': 3,
  'axe': 4,
  'scimitar': 5,
  'katana': 6,
  'twoHandedSword': 7,
  'spear': 8,
};
const _CharacterweaponTypeValueEnumMap = {
  0: WeaponType.sword,
  1: WeaponType.rapier,
  2: WeaponType.dagger,
  3: WeaponType.mace,
  4: WeaponType.axe,
  5: WeaponType.scimitar,
  6: WeaponType.katana,
  7: WeaponType.twoHandedSword,
  8: WeaponType.spear,
};

Id _characterGetId(Character object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _characterGetLinks(Character object) {
  return [];
}

void _characterAttach(IsarCollection<dynamic> col, Id id, Character object) {
  object.id = id;
}

extension CharacterQueryWhereSort
    on QueryBuilder<Character, Character, QWhere> {
  QueryBuilder<Character, Character, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CharacterQueryWhere
    on QueryBuilder<Character, Character, QWhereClause> {
  QueryBuilder<Character, Character, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Character, Character, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idBetween(
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

  QueryBuilder<Character, Character, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [null]),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> nameEqualTo(
    String? name,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> nameNotEqualTo(
    String? name,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension CharacterQueryFilter
    on QueryBuilder<Character, Character, QFilterCondition> {
  QueryBuilder<Character, Character, QAfterFilterCondition> affectionEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'affection', value: value),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
  affectionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'affection',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> affectionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'affection',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> affectionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'affection',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> armorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'armor'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> armorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'armor'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> bedtimesEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bedtimes', value: value),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> bedtimesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bedtimes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> bedtimesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bedtimes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> bedtimesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bedtimes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> bootsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'boots'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> bootsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'boots'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> helmetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'helmet'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> helmetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'helmet'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'name'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'name'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> shieldIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'shield'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> shieldIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'shield'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> weaponIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'weapon'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> weaponIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'weapon'),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> weaponTypeEqualTo(
    WeaponType value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'weaponType', value: value),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
  weaponTypeGreaterThan(WeaponType value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'weaponType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> weaponTypeLessThan(
    WeaponType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'weaponType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> weaponTypeBetween(
    WeaponType lower,
    WeaponType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'weaponType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CharacterQueryObject
    on QueryBuilder<Character, Character, QFilterCondition> {
  QueryBuilder<Character, Character, QAfterFilterCondition> armor(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'armor');
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> boots(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'boots');
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> helmet(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'helmet');
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> shield(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'shield');
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> weapon(
    FilterQuery<Weapon> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weapon');
    });
  }
}

extension CharacterQueryLinks
    on QueryBuilder<Character, Character, QFilterCondition> {}

extension CharacterQuerySortBy on QueryBuilder<Character, Character, QSortBy> {
  QueryBuilder<Character, Character, QAfterSortBy> sortByAffection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affection', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByAffectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affection', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByBedtimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimes', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByBedtimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimes', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByWeaponType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaponType', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByWeaponTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaponType', Sort.desc);
    });
  }
}

extension CharacterQuerySortThenBy
    on QueryBuilder<Character, Character, QSortThenBy> {
  QueryBuilder<Character, Character, QAfterSortBy> thenByAffection() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affection', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByAffectionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'affection', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByBedtimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimes', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByBedtimesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedtimes', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByWeaponType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaponType', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByWeaponTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaponType', Sort.desc);
    });
  }
}

extension CharacterQueryWhereDistinct
    on QueryBuilder<Character, Character, QDistinct> {
  QueryBuilder<Character, Character, QDistinct> distinctByAffection() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'affection');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByBedtimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bedtimes');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByWeaponType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weaponType');
    });
  }
}

extension CharacterQueryProperty
    on QueryBuilder<Character, Character, QQueryProperty> {
  QueryBuilder<Character, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> affectionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'affection');
    });
  }

  QueryBuilder<Character, Gear?, QQueryOperations> armorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'armor');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> bedtimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bedtimes');
    });
  }

  QueryBuilder<Character, Gear?, QQueryOperations> bootsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boots');
    });
  }

  QueryBuilder<Character, Gear?, QQueryOperations> helmetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'helmet');
    });
  }

  QueryBuilder<Character, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Character, Gear?, QQueryOperations> shieldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shield');
    });
  }

  QueryBuilder<Character, Weapon?, QQueryOperations> weaponProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weapon');
    });
  }

  QueryBuilder<Character, WeaponType, QQueryOperations> weaponTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weaponType');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WeaponSchema = Schema(
  name: r'Weapon',
  id: -7996961866191931403,
  properties: {
    r'extraStats': PropertySchema(
      id: 0,
      name: r'extraStats',
      type: IsarType.string,
    ),
    r'hands': PropertySchema(id: 1, name: r'hands', type: IsarType.long),
    r'statValue': PropertySchema(
      id: 2,
      name: r'statValue',
      type: IsarType.long,
    ),
  },

  estimateSize: _weaponEstimateSize,
  serialize: _weaponSerialize,
  deserialize: _weaponDeserialize,
  deserializeProp: _weaponDeserializeProp,
);

int _weaponEstimateSize(
  Weapon object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.extraStats;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _weaponSerialize(
  Weapon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.extraStats);
  writer.writeLong(offsets[1], object.hands);
  writer.writeLong(offsets[2], object.statValue);
}

Weapon _weaponDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Weapon();
  object.extraStats = reader.readStringOrNull(offsets[0]);
  object.hands = reader.readLong(offsets[1]);
  object.statValue = reader.readLong(offsets[2]);
  return object;
}

P _weaponDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WeaponQueryFilter on QueryBuilder<Weapon, Weapon, QFilterCondition> {
  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'extraStats'),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'extraStats'),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'extraStats',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'extraStats',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'extraStats',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'extraStats',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'extraStats',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'extraStats',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'extraStats',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'extraStats',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'extraStats', value: ''),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> extraStatsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'extraStats', value: ''),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> handsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hands', value: value),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> handsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hands',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> handsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hands',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> handsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hands',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> statValueEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statValue', value: value),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> statValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'statValue',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> statValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'statValue',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Weapon, Weapon, QAfterFilterCondition> statValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'statValue',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension WeaponQueryObject on QueryBuilder<Weapon, Weapon, QFilterCondition> {}
