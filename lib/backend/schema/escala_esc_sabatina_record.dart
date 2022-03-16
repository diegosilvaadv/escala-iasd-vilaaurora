import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'escala_esc_sabatina_record.g.dart';

abstract class EscalaEscSabatinaRecord
    implements Built<EscalaEscSabatinaRecord, EscalaEscSabatinaRecordBuilder> {
  static Serializer<EscalaEscSabatinaRecord> get serializer =>
      _$escalaEscSabatinaRecordSerializer;

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

  static void _initializeBuilder(EscalaEscSabatinaRecordBuilder builder) =>
      builder
        ..nome = ''
        ..img = ''
        ..status = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('escala_esc_sabatina');

  static Stream<EscalaEscSabatinaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EscalaEscSabatinaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EscalaEscSabatinaRecord._();
  factory EscalaEscSabatinaRecord(
          [void Function(EscalaEscSabatinaRecordBuilder) updates]) =
      _$EscalaEscSabatinaRecord;

  static EscalaEscSabatinaRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEscalaEscSabatinaRecordData({
  String nome,
  DateTime data,
  String img,
  bool status,
}) =>
    serializers.toFirestore(
        EscalaEscSabatinaRecord.serializer,
        EscalaEscSabatinaRecord((e) => e
          ..nome = nome
          ..data = data
          ..img = img
          ..status = status));
