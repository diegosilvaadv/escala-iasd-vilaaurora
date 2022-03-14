import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/escala_sonoplastia_record.dart';
import 'schema/escala_pregadores_record.dart';
import 'schema/escala_musical_record.dart';
import 'schema/escala_limpeza_record.dart';
import 'schema/escala_esc_sabatina_record.dart';
import 'schema/escala_pastoral_record.dart';
import 'schema/serializers.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/escala_sonoplastia_record.dart';
export 'schema/escala_pregadores_record.dart';
export 'schema/escala_musical_record.dart';
export 'schema/escala_limpeza_record.dart';
export 'schema/escala_esc_sabatina_record.dart';
export 'schema/escala_pastoral_record.dart';

/// Functions to query EscalaSonoplastiaRecords (as a Stream and as a Future).
Stream<List<EscalaSonoplastiaRecord>> queryEscalaSonoplastiaRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EscalaSonoplastiaRecord.collection, EscalaSonoplastiaRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EscalaSonoplastiaRecord>> queryEscalaSonoplastiaRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EscalaSonoplastiaRecord.collection, EscalaSonoplastiaRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query EscalaPregadoresRecords (as a Stream and as a Future).
Stream<List<EscalaPregadoresRecord>> queryEscalaPregadoresRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EscalaPregadoresRecord.collection, EscalaPregadoresRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EscalaPregadoresRecord>> queryEscalaPregadoresRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EscalaPregadoresRecord.collection, EscalaPregadoresRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query EscalaMusicalRecords (as a Stream and as a Future).
Stream<List<EscalaMusicalRecord>> queryEscalaMusicalRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EscalaMusicalRecord.collection, EscalaMusicalRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EscalaMusicalRecord>> queryEscalaMusicalRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EscalaMusicalRecord.collection, EscalaMusicalRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query EscalaLimpezaRecords (as a Stream and as a Future).
Stream<List<EscalaLimpezaRecord>> queryEscalaLimpezaRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EscalaLimpezaRecord.collection, EscalaLimpezaRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EscalaLimpezaRecord>> queryEscalaLimpezaRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EscalaLimpezaRecord.collection, EscalaLimpezaRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query EscalaEscSabatinaRecords (as a Stream and as a Future).
Stream<List<EscalaEscSabatinaRecord>> queryEscalaEscSabatinaRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EscalaEscSabatinaRecord.collection, EscalaEscSabatinaRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EscalaEscSabatinaRecord>> queryEscalaEscSabatinaRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EscalaEscSabatinaRecord.collection, EscalaEscSabatinaRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

/// Functions to query EscalaPastoralRecords (as a Stream and as a Future).
Stream<List<EscalaPastoralRecord>> queryEscalaPastoralRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        EscalaPastoralRecord.collection, EscalaPastoralRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<EscalaPastoralRecord>> queryEscalaPastoralRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        EscalaPastoralRecord.collection, EscalaPastoralRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Stream<List<T>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}
