import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'escala_pastoral_record.g.dart';

abstract class EscalaPastoralRecord
    implements Built<EscalaPastoralRecord, EscalaPastoralRecordBuilder> {
  static Serializer<EscalaPastoralRecord> get serializer =>
      _$escalaPastoralRecordSerializer;

  @nullable
  String get nome;

  @nullable
  DateTime get data;

  @nullable
  String get img;

  @nullable
  bool get status;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EscalaPastoralRecordBuilder builder) => builder
    ..nome = ''
    ..img = ''
    ..status = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('escala_pastoral');

  static Stream<EscalaPastoralRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EscalaPastoralRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EscalaPastoralRecord._();
  factory EscalaPastoralRecord(
          [void Function(EscalaPastoralRecordBuilder) updates]) =
      _$EscalaPastoralRecord;

  static EscalaPastoralRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEscalaPastoralRecordData({
  String nome,
  DateTime data,
  String img,
  bool status,
}) =>
    serializers.toFirestore(
        EscalaPastoralRecord.serializer,
        EscalaPastoralRecord((e) => e
          ..nome = nome
          ..data = data
          ..img = img
          ..status = status));
