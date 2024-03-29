// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSemesterCollection on Isar {
  IsarCollection<Semester> get semesters => this.collection();
}

const SemesterSchema = CollectionSchema(
  name: r'Semester',
  id: -4943155724269528796,
  properties: {
    r'created': PropertySchema(
      id: 0,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'descrption': PropertySchema(
      id: 1,
      name: r'descrption',
      type: IsarType.string,
    ),
    r'from': PropertySchema(
      id: 2,
      name: r'from',
      type: IsarType.dateTime,
    ),
    r'hasListeners': PropertySchema(
      id: 3,
      name: r'hasListeners',
      type: IsarType.bool,
    ),
    r'label': PropertySchema(
      id: 4,
      name: r'label',
      type: IsarType.string,
    ),
    r'last_modified': PropertySchema(
      id: 5,
      name: r'last_modified',
      type: IsarType.dateTime,
    ),
    r'object_id': PropertySchema(
      id: 6,
      name: r'object_id',
      type: IsarType.string,
    ),
    r'owner': PropertySchema(
      id: 7,
      name: r'owner',
      type: IsarType.string,
    ),
    r'to': PropertySchema(
      id: 8,
      name: r'to',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _semesterEstimateSize,
  serialize: _semesterSerialize,
  deserialize: _semesterDeserialize,
  deserializeProp: _semesterDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'timetables': LinkSchema(
      id: 6343049082187427245,
      name: r'timetables',
      target: r'Timetable',
      single: false,
      linkName: r'semester',
    ),
    r'tasks': LinkSchema(
      id: -2321317306104324129,
      name: r'tasks',
      target: r'Task',
      single: false,
      linkName: r'semester',
    ),
    r'units': LinkSchema(
      id: 7985919064070466961,
      name: r'units',
      target: r'Unit',
      single: false,
      linkName: r'semester',
    ),
    r'events': LinkSchema(
      id: 4126841691087787373,
      name: r'events',
      target: r'Event',
      single: false,
      linkName: r'semester',
    ),
    r'homeworks': LinkSchema(
      id: 8718996671317519306,
      name: r'homeworks',
      target: r'Homework',
      single: false,
      linkName: r'semester',
    )
  },
  embeddedSchemas: {},
  getId: _semesterGetId,
  getLinks: _semesterGetLinks,
  attach: _semesterAttach,
  version: '3.1.0+1',
);

int _semesterEstimateSize(
  Semester object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.descrption;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.label.length * 3;
  {
    final value = object.objectID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.owner;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _semesterSerialize(
  Semester object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.created);
  writer.writeString(offsets[1], object.descrption);
  writer.writeDateTime(offsets[2], object.from);
  writer.writeBool(offsets[3], object.hasListeners);
  writer.writeString(offsets[4], object.label);
  writer.writeDateTime(offsets[5], object.lastModified);
  writer.writeString(offsets[6], object.objectID);
  writer.writeString(offsets[7], object.owner);
  writer.writeDateTime(offsets[8], object.to);
}

Semester _semesterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Semester(
    descrption: reader.readStringOrNull(offsets[1]),
    from: reader.readDateTime(offsets[2]),
    label: reader.readString(offsets[4]),
    to: reader.readDateTime(offsets[8]),
  );
  object.created = reader.readDateTime(offsets[0]);
  object.id = id;
  object.lastModified = reader.readDateTime(offsets[5]);
  object.objectID = reader.readStringOrNull(offsets[6]);
  object.owner = reader.readStringOrNull(offsets[7]);
  return object;
}

P _semesterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _semesterGetId(Semester object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _semesterGetLinks(Semester object) {
  return [
    object.timetables,
    object.tasks,
    object.units,
    object.events,
    object.homeworks
  ];
}

void _semesterAttach(IsarCollection<dynamic> col, Id id, Semester object) {
  object.id = id;
  object.timetables
      .attach(col, col.isar.collection<Timetable>(), r'timetables', id);
  object.tasks.attach(col, col.isar.collection<Task>(), r'tasks', id);
  object.units.attach(col, col.isar.collection<Unit>(), r'units', id);
  object.events.attach(col, col.isar.collection<Event>(), r'events', id);
  object.homeworks
      .attach(col, col.isar.collection<Homework>(), r'homeworks', id);
}

extension SemesterQueryWhereSort on QueryBuilder<Semester, Semester, QWhere> {
  QueryBuilder<Semester, Semester, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SemesterQueryWhere on QueryBuilder<Semester, Semester, QWhereClause> {
  QueryBuilder<Semester, Semester, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Semester, Semester, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Semester, Semester, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Semester, Semester, QAfterWhereClause> idBetween(
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

extension SemesterQueryFilter
    on QueryBuilder<Semester, Semester, QFilterCondition> {
  QueryBuilder<Semester, Semester, QAfterFilterCondition> createdEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> createdGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> createdLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> createdBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descrption',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      descrptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descrption',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descrption',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descrption',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descrption',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descrption',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descrption',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descrption',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descrption',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descrption',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> descrptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descrption',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      descrptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descrption',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> fromEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> fromGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'from',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> fromLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'from',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> fromBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'from',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> hasListenersEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasListeners',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<Semester, Semester, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> lastModifiedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_modified',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      lastModifiedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_modified',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> lastModifiedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_modified',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> lastModifiedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_modified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'object_id',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'object_id',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'object_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'object_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'object_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'object_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'object_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'object_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'object_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'object_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'object_id',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> objectIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'object_id',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'owner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'owner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'owner',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> ownerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'owner',
        value: '',
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> toEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> toGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> toLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> toBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'to',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SemesterQueryObject
    on QueryBuilder<Semester, Semester, QFilterCondition> {}

extension SemesterQueryLinks
    on QueryBuilder<Semester, Semester, QFilterCondition> {
  QueryBuilder<Semester, Semester, QAfterFilterCondition> timetables(
      FilterQuery<Timetable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'timetables');
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      timetablesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'timetables', length, true, length, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> timetablesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'timetables', 0, true, 0, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      timetablesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'timetables', 0, false, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      timetablesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'timetables', 0, true, length, include);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      timetablesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'timetables', length, include, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      timetablesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'timetables', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> tasks(
      FilterQuery<Task> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tasks');
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> tasksLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, true, length, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> tasksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, 0, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> tasksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, false, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> tasksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', 0, true, length, include);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      tasksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tasks', length, include, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> tasksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tasks', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> units(
      FilterQuery<Unit> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'units');
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> unitsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'units', length, true, length, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> unitsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'units', 0, true, 0, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> unitsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'units', 0, false, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> unitsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'units', 0, true, length, include);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      unitsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'units', length, include, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> unitsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'units', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> events(
      FilterQuery<Event> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'events');
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> eventsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', length, true, length, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> eventsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', 0, true, 0, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> eventsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', 0, false, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> eventsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', 0, true, length, include);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      eventsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'events', length, include, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> eventsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'events', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> homeworks(
      FilterQuery<Homework> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'homeworks');
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      homeworksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'homeworks', length, true, length, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition> homeworksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'homeworks', 0, true, 0, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      homeworksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'homeworks', 0, false, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      homeworksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'homeworks', 0, true, length, include);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      homeworksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'homeworks', length, include, 999999, true);
    });
  }

  QueryBuilder<Semester, Semester, QAfterFilterCondition>
      homeworksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'homeworks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension SemesterQuerySortBy on QueryBuilder<Semester, Semester, QSortBy> {
  QueryBuilder<Semester, Semester, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByDescrption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descrption', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByDescrptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descrption', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByHasListenersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByObjectID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByObjectIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> sortByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }
}

extension SemesterQuerySortThenBy
    on QueryBuilder<Semester, Semester, QSortThenBy> {
  QueryBuilder<Semester, Semester, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByDescrption() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descrption', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByDescrptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descrption', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByHasListenersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByObjectID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByObjectIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.asc);
    });
  }

  QueryBuilder<Semester, Semester, QAfterSortBy> thenByToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to', Sort.desc);
    });
  }
}

extension SemesterQueryWhereDistinct
    on QueryBuilder<Semester, Semester, QDistinct> {
  QueryBuilder<Semester, Semester, QDistinct> distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByDescrption(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descrption', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'from');
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasListeners');
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_modified');
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByObjectID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'object_id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByOwner(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'owner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Semester, Semester, QDistinct> distinctByTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'to');
    });
  }
}

extension SemesterQueryProperty
    on QueryBuilder<Semester, Semester, QQueryProperty> {
  QueryBuilder<Semester, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Semester, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<Semester, String?, QQueryOperations> descrptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descrption');
    });
  }

  QueryBuilder<Semester, DateTime, QQueryOperations> fromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'from');
    });
  }

  QueryBuilder<Semester, bool, QQueryOperations> hasListenersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasListeners');
    });
  }

  QueryBuilder<Semester, String, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<Semester, DateTime, QQueryOperations> lastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_modified');
    });
  }

  QueryBuilder<Semester, String?, QQueryOperations> objectIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'object_id');
    });
  }

  QueryBuilder<Semester, String?, QQueryOperations> ownerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'owner');
    });
  }

  QueryBuilder<Semester, DateTime, QQueryOperations> toProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'to');
    });
  }
}
