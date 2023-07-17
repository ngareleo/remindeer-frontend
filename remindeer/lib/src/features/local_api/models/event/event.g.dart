// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEventCollection on Isar {
  IsarCollection<Event> get events => this.collection();
}

const EventSchema = CollectionSchema(
  name: r'Event',
  id: 2102939193127251002,
  properties: {
    r'created': PropertySchema(
      id: 0,
      name: r'created',
      type: IsarType.dateTime,
    ),
    r'dayOfWeek': PropertySchema(
      id: 1,
      name: r'dayOfWeek',
      type: IsarType.string,
      enumMap: _EventdayOfWeekEnumValueMap,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'event_date': PropertySchema(
      id: 3,
      name: r'event_date',
      type: IsarType.dateTime,
    ),
    r'hasListeners': PropertySchema(
      id: 4,
      name: r'hasListeners',
      type: IsarType.bool,
    ),
    r'label': PropertySchema(
      id: 5,
      name: r'label',
      type: IsarType.string,
    ),
    r'last_modified': PropertySchema(
      id: 6,
      name: r'last_modified',
      type: IsarType.dateTime,
    ),
    r'object_id': PropertySchema(
      id: 7,
      name: r'object_id',
      type: IsarType.string,
    ),
    r'owner': PropertySchema(
      id: 8,
      name: r'owner',
      type: IsarType.string,
    ),
    r'repeat': PropertySchema(
      id: 9,
      name: r'repeat',
      type: IsarType.byte,
      enumMap: _EventrepeatEnumValueMap,
    ),
    r'repeat_to': PropertySchema(
      id: 10,
      name: r'repeat_to',
      type: IsarType.dateTime,
    ),
    r'venue': PropertySchema(
      id: 11,
      name: r'venue',
      type: IsarType.string,
    ),
    r'window': PropertySchema(
      id: 12,
      name: r'window',
      type: IsarType.object,
      target: r'EventWindow',
    )
  },
  estimateSize: _eventEstimateSize,
  serialize: _eventSerialize,
  deserialize: _eventDeserialize,
  deserializeProp: _eventDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'unit': LinkSchema(
      id: -6425711384105100011,
      name: r'unit',
      target: r'Unit',
      single: true,
    ),
    r'semester': LinkSchema(
      id: 5858876934849113603,
      name: r'semester',
      target: r'Semester',
      single: true,
    ),
    r'timetable': LinkSchema(
      id: 8986610906877385768,
      name: r'timetable',
      target: r'Timetable',
      single: true,
    )
  },
  embeddedSchemas: {r'EventWindow': EventWindowSchema},
  getId: _eventGetId,
  getLinks: _eventGetLinks,
  attach: _eventAttach,
  version: '3.1.0+1',
);

int _eventEstimateSize(
  Event object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dayOfWeek;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.description;
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
  {
    final value = object.venue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 +
      EventWindowSchema.estimateSize(
          object.window, allOffsets[EventWindow]!, allOffsets);
  return bytesCount;
}

void _eventSerialize(
  Event object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.created);
  writer.writeString(offsets[1], object.dayOfWeek?.name);
  writer.writeString(offsets[2], object.description);
  writer.writeDateTime(offsets[3], object.eventDate);
  writer.writeBool(offsets[4], object.hasListeners);
  writer.writeString(offsets[5], object.label);
  writer.writeDateTime(offsets[6], object.lastModified);
  writer.writeString(offsets[7], object.objectID);
  writer.writeString(offsets[8], object.owner);
  writer.writeByte(offsets[9], object.repeat.index);
  writer.writeDateTime(offsets[10], object.repeatTo);
  writer.writeString(offsets[11], object.venue);
  writer.writeObject<EventWindow>(
    offsets[12],
    allOffsets,
    EventWindowSchema.serialize,
    object.window,
  );
}

Event _eventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Event(
    dayOfWeek: _EventdayOfWeekValueEnumMap[reader.readStringOrNull(offsets[1])],
    description: reader.readStringOrNull(offsets[2]),
    eventDate: reader.readDateTimeOrNull(offsets[3]),
    label: reader.readString(offsets[5]),
    repeat: _EventrepeatValueEnumMap[reader.readByteOrNull(offsets[9])] ??
        RepeatFrequency.none,
    repeatTo: reader.readDateTimeOrNull(offsets[10]),
    venue: reader.readStringOrNull(offsets[11]),
    window: reader.readObjectOrNull<EventWindow>(
          offsets[12],
          EventWindowSchema.deserialize,
          allOffsets,
        ) ??
        EventWindow(),
  );
  object.created = reader.readDateTime(offsets[0]);
  object.id = id;
  object.lastModified = reader.readDateTime(offsets[6]);
  object.objectID = reader.readStringOrNull(offsets[7]);
  object.owner = reader.readStringOrNull(offsets[8]);
  return object;
}

P _eventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (_EventdayOfWeekValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (_EventrepeatValueEnumMap[reader.readByteOrNull(offset)] ??
          RepeatFrequency.none) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readObjectOrNull<EventWindow>(
            offset,
            EventWindowSchema.deserialize,
            allOffsets,
          ) ??
          EventWindow()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EventdayOfWeekEnumValueMap = {
  r'monday': r'monday',
  r'tuesday': r'tuesday',
  r'wednesday': r'wednesday',
  r'thursday': r'thursday',
  r'friday': r'friday',
  r'saturday': r'saturday',
  r'sunday': r'sunday',
};
const _EventdayOfWeekValueEnumMap = {
  r'monday': DaysOfWeek.monday,
  r'tuesday': DaysOfWeek.tuesday,
  r'wednesday': DaysOfWeek.wednesday,
  r'thursday': DaysOfWeek.thursday,
  r'friday': DaysOfWeek.friday,
  r'saturday': DaysOfWeek.saturday,
  r'sunday': DaysOfWeek.sunday,
};
const _EventrepeatEnumValueMap = {
  'none': 0,
  'daily': 1,
  'weekly': 2,
  'monthly': 3,
  'annually': 4,
};
const _EventrepeatValueEnumMap = {
  0: RepeatFrequency.none,
  1: RepeatFrequency.daily,
  2: RepeatFrequency.weekly,
  3: RepeatFrequency.monthly,
  4: RepeatFrequency.annually,
};

Id _eventGetId(Event object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _eventGetLinks(Event object) {
  return [object.unit, object.semester, object.timetable];
}

void _eventAttach(IsarCollection<dynamic> col, Id id, Event object) {
  object.id = id;
  object.unit.attach(col, col.isar.collection<Unit>(), r'unit', id);
  object.semester.attach(col, col.isar.collection<Semester>(), r'semester', id);
  object.timetable
      .attach(col, col.isar.collection<Timetable>(), r'timetable', id);
}

extension EventQueryWhereSort on QueryBuilder<Event, Event, QWhere> {
  QueryBuilder<Event, Event, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EventQueryWhere on QueryBuilder<Event, Event, QWhereClause> {
  QueryBuilder<Event, Event, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Event, Event, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idBetween(
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

extension EventQueryFilter on QueryBuilder<Event, Event, QFilterCondition> {
  QueryBuilder<Event, Event, QAfterFilterCondition> createdEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> createdGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> createdLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> createdBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfWeek',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfWeek',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekEqualTo(
    DaysOfWeek? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekGreaterThan(
    DaysOfWeek? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekLessThan(
    DaysOfWeek? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekBetween(
    DaysOfWeek? lower,
    DaysOfWeek? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dayOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dayOfWeek',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dayOfWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dayOfWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'event_date',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'event_date',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'event_date',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'event_date',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'event_date',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> eventDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'event_date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> hasListenersEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasListeners',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> labelEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> labelGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> labelLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> labelBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> labelStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> labelEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> labelContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> labelMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> lastModifiedEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_modified',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> lastModifiedGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> lastModifiedLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> lastModifiedBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'object_id',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'object_id',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDContains(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDMatches(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'object_id',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> objectIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'object_id',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'owner',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'owner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'owner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'owner',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> ownerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'owner',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatEqualTo(
      RepeatFrequency value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeat',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatGreaterThan(
    RepeatFrequency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeat',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatLessThan(
    RepeatFrequency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeat',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatBetween(
    RepeatFrequency lower,
    RepeatFrequency upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repeat_to',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repeat_to',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatToEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeat_to',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatToGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeat_to',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatToLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeat_to',
        value: value,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> repeatToBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeat_to',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'venue',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'venue',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'venue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'venue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venue',
        value: '',
      ));
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> venueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'venue',
        value: '',
      ));
    });
  }
}

extension EventQueryObject on QueryBuilder<Event, Event, QFilterCondition> {
  QueryBuilder<Event, Event, QAfterFilterCondition> window(
      FilterQuery<EventWindow> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'window');
    });
  }
}

extension EventQueryLinks on QueryBuilder<Event, Event, QFilterCondition> {
  QueryBuilder<Event, Event, QAfterFilterCondition> unit(FilterQuery<Unit> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'unit');
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'unit', 0, true, 0, true);
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> semester(
      FilterQuery<Semester> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'semester');
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> semesterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'semester', 0, true, 0, true);
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> timetable(
      FilterQuery<Timetable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'timetable');
    });
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> timetableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'timetable', 0, true, 0, true);
    });
  }
}

extension EventQuerySortBy on QueryBuilder<Event, Event, QSortBy> {
  QueryBuilder<Event, Event, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event_date', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEventDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event_date', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByHasListenersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByObjectID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByObjectIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRepeatTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat_to', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByRepeatToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat_to', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension EventQuerySortThenBy on QueryBuilder<Event, Event, QSortThenBy> {
  QueryBuilder<Event, Event, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event_date', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEventDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event_date', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByHasListenersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_modified', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByObjectID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByObjectIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'object_id', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByOwner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByOwnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owner', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRepeatTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat_to', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByRepeatToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat_to', Sort.desc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension EventQueryWhereDistinct on QueryBuilder<Event, Event, QDistinct> {
  QueryBuilder<Event, Event, QDistinct> distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created');
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByDayOfWeek(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfWeek', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByEventDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'event_date');
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasListeners');
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_modified');
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByObjectID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'object_id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByOwner(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'owner', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeat');
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByRepeatTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeat_to');
    });
  }

  QueryBuilder<Event, Event, QDistinct> distinctByVenue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'venue', caseSensitive: caseSensitive);
    });
  }
}

extension EventQueryProperty on QueryBuilder<Event, Event, QQueryProperty> {
  QueryBuilder<Event, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Event, DateTime, QQueryOperations> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created');
    });
  }

  QueryBuilder<Event, DaysOfWeek?, QQueryOperations> dayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfWeek');
    });
  }

  QueryBuilder<Event, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Event, DateTime?, QQueryOperations> eventDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'event_date');
    });
  }

  QueryBuilder<Event, bool, QQueryOperations> hasListenersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasListeners');
    });
  }

  QueryBuilder<Event, String, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<Event, DateTime, QQueryOperations> lastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_modified');
    });
  }

  QueryBuilder<Event, String?, QQueryOperations> objectIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'object_id');
    });
  }

  QueryBuilder<Event, String?, QQueryOperations> ownerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'owner');
    });
  }

  QueryBuilder<Event, RepeatFrequency, QQueryOperations> repeatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeat');
    });
  }

  QueryBuilder<Event, DateTime?, QQueryOperations> repeatToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeat_to');
    });
  }

  QueryBuilder<Event, String?, QQueryOperations> venueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'venue');
    });
  }

  QueryBuilder<Event, EventWindow, QQueryOperations> windowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'window');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const EventWindowSchema = Schema(
  name: r'EventWindow',
  id: 3784424850019363100,
  properties: {
    r'from': PropertySchema(
      id: 0,
      name: r'from',
      type: IsarType.long,
    ),
    r'isAllDay': PropertySchema(
      id: 1,
      name: r'isAllDay',
      type: IsarType.bool,
    ),
    r'to': PropertySchema(
      id: 2,
      name: r'to',
      type: IsarType.long,
    )
  },
  estimateSize: _eventWindowEstimateSize,
  serialize: _eventWindowSerialize,
  deserialize: _eventWindowDeserialize,
  deserializeProp: _eventWindowDeserializeProp,
);

int _eventWindowEstimateSize(
  EventWindow object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _eventWindowSerialize(
  EventWindow object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.from);
  writer.writeBool(offsets[1], object.isAllDay);
  writer.writeLong(offsets[2], object.to);
}

EventWindow _eventWindowDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventWindow(
    from: reader.readLongOrNull(offsets[0]),
    isAllDay: reader.readBoolOrNull(offsets[1]),
    to: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _eventWindowDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension EventWindowQueryFilter
    on QueryBuilder<EventWindow, EventWindow, QFilterCondition> {
  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> fromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'from',
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition>
      fromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'from',
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> fromEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from',
        value: value,
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> fromGreaterThan(
    int? value, {
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

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> fromLessThan(
    int? value, {
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

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> fromBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition>
      isAllDayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isAllDay',
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition>
      isAllDayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isAllDay',
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> isAllDayEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAllDay',
        value: value,
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> toIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'to',
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> toIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'to',
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> toEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to',
        value: value,
      ));
    });
  }

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> toGreaterThan(
    int? value, {
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

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> toLessThan(
    int? value, {
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

  QueryBuilder<EventWindow, EventWindow, QAfterFilterCondition> toBetween(
    int? lower,
    int? upper, {
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

extension EventWindowQueryObject
    on QueryBuilder<EventWindow, EventWindow, QFilterCondition> {}
