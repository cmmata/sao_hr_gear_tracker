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
    r'armor': PropertySchema(
      id: 0,
      name: r'armor',
      type: IsarType.object,
      target: r'Gear',
    ),
    r'boots': PropertySchema(
      id: 1,
      name: r'boots',
      type: IsarType.object,
      target: r'Gear',
    ),
    r'helmet': PropertySchema(
      id: 2,
      name: r'helmet',
      type: IsarType.object,
      target: r'Gear',
    ),
    r'name': PropertySchema(id: 3, name: r'name', type: IsarType.string),
    r'weapon': PropertySchema(
      id: 4,
      name: r'weapon',
      type: IsarType.object,
      target: r'Gear',
    ),
    r'weaponType': PropertySchema(
      id: 5,
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
  indexes: {},
  links: {},
  embeddedSchemas: {r'Gear': GearSchema},
  getId: _characterGetId,
  getLinks: _characterGetLinks,
  attach: _characterAttach,
  version: '3.1.0+1',
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
    final value = object.weapon;
    if (value != null) {
      bytesCount +=
          3 + GearSchema.estimateSize(value, allOffsets[Gear]!, allOffsets);
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
  writer.writeObject<Gear>(
    offsets[0],
    allOffsets,
    GearSchema.serialize,
    object.armor,
  );
  writer.writeObject<Gear>(
    offsets[1],
    allOffsets,
    GearSchema.serialize,
    object.boots,
  );
  writer.writeObject<Gear>(
    offsets[2],
    allOffsets,
    GearSchema.serialize,
    object.helmet,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeObject<Gear>(
    offsets[4],
    allOffsets,
    GearSchema.serialize,
    object.weapon,
  );
  writer.writeByte(offsets[5], object.weaponType.index);
}

Character _characterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Character();
  object.armor = reader.readObjectOrNull<Gear>(
    offsets[0],
    GearSchema.deserialize,
    allOffsets,
  );
  object.boots = reader.readObjectOrNull<Gear>(
    offsets[1],
    GearSchema.deserialize,
    allOffsets,
  );
  object.helmet = reader.readObjectOrNull<Gear>(
    offsets[2],
    GearSchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.name = reader.readStringOrNull(offsets[3]);
  object.weapon = reader.readObjectOrNull<Gear>(
    offsets[4],
    GearSchema.deserialize,
    allOffsets,
  );
  object.weaponType =
      _CharacterweaponTypeValueEnumMap[reader.readByteOrNull(offsets[5])] ??
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
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 1:
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 2:
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<Gear>(
            offset,
            GearSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 5:
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
  'shield': 9,
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
  9: WeaponType.shield,
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
}

extension CharacterQueryFilter
    on QueryBuilder<Character, Character, QFilterCondition> {
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

  QueryBuilder<Character, Character, QAfterFilterCondition> weapon(
    FilterQuery<Gear> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weapon');
    });
  }
}

extension CharacterQueryLinks
    on QueryBuilder<Character, Character, QFilterCondition> {}

extension CharacterQuerySortBy on QueryBuilder<Character, Character, QSortBy> {
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

  QueryBuilder<Character, Gear?, QQueryOperations> armorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'armor');
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

  QueryBuilder<Character, Gear?, QQueryOperations> weaponProperty() {
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
