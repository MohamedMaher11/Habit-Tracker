// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppsittingCollection on Isar {
  IsarCollection<Appsitting> get appsittings => this.collection();
}

const AppsittingSchema = CollectionSchema(
  name: r'Appsitting',
  id: 2118753161360239230,
  properties: {
    r'firstlaunchDate': PropertySchema(
      id: 0,
      name: r'firstlaunchDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _appsittingEstimateSize,
  serialize: _appsittingSerialize,
  deserialize: _appsittingDeserialize,
  deserializeProp: _appsittingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appsittingGetId,
  getLinks: _appsittingGetLinks,
  attach: _appsittingAttach,
  version: '3.1.0+1',
);

int _appsittingEstimateSize(
  Appsitting object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _appsittingSerialize(
  Appsitting object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.firstlaunchDate);
}

Appsitting _appsittingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Appsitting();
  object.firstlaunchDate = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _appsittingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appsittingGetId(Appsitting object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appsittingGetLinks(Appsitting object) {
  return [];
}

void _appsittingAttach(IsarCollection<dynamic> col, Id id, Appsitting object) {
  object.id = id;
}

extension AppsittingQueryWhereSort
    on QueryBuilder<Appsitting, Appsitting, QWhere> {
  QueryBuilder<Appsitting, Appsitting, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppsittingQueryWhere
    on QueryBuilder<Appsitting, Appsitting, QWhereClause> {
  QueryBuilder<Appsitting, Appsitting, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Appsitting, Appsitting, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppsittingQueryFilter
    on QueryBuilder<Appsitting, Appsitting, QFilterCondition> {
  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition>
      firstlaunchDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstlaunchDate',
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition>
      firstlaunchDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstlaunchDate',
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition>
      firstlaunchDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstlaunchDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition>
      firstlaunchDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstlaunchDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition>
      firstlaunchDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstlaunchDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition>
      firstlaunchDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstlaunchDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppsittingQueryObject
    on QueryBuilder<Appsitting, Appsitting, QFilterCondition> {}

extension AppsittingQueryLinks
    on QueryBuilder<Appsitting, Appsitting, QFilterCondition> {}

extension AppsittingQuerySortBy
    on QueryBuilder<Appsitting, Appsitting, QSortBy> {
  QueryBuilder<Appsitting, Appsitting, QAfterSortBy> sortByFirstlaunchDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunchDate', Sort.asc);
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterSortBy>
      sortByFirstlaunchDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunchDate', Sort.desc);
    });
  }
}

extension AppsittingQuerySortThenBy
    on QueryBuilder<Appsitting, Appsitting, QSortThenBy> {
  QueryBuilder<Appsitting, Appsitting, QAfterSortBy> thenByFirstlaunchDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunchDate', Sort.asc);
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterSortBy>
      thenByFirstlaunchDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstlaunchDate', Sort.desc);
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Appsitting, Appsitting, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension AppsittingQueryWhereDistinct
    on QueryBuilder<Appsitting, Appsitting, QDistinct> {
  QueryBuilder<Appsitting, Appsitting, QDistinct> distinctByFirstlaunchDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstlaunchDate');
    });
  }
}

extension AppsittingQueryProperty
    on QueryBuilder<Appsitting, Appsitting, QQueryProperty> {
  QueryBuilder<Appsitting, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Appsitting, DateTime?, QQueryOperations>
      firstlaunchDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstlaunchDate');
    });
  }
}
