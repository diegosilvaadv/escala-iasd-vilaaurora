import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'escala_pregadores_record.g.dart';

abstract class EscalaPregadoresRecord
    implements Built<EscalaPregadoresRecord, EscalaPregadoresRecordBuilder> {
  static Serializer<EscalaPregadoresRecord> get serializer =>
      _$escalaPregadoresRecordSerializer;

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

  static void _initializeBuilder(EscalaPregadoresRecordBuilder builder) =>
      builder
        ..nome = ''
        ..img = ''
        ..status = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('escala_pregadores');

  static Stream<EscalaPregadoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EscalaPregadoresRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EscalaPregadoresRecord._();
  factory EscalaPregadoresRecord(
          [void Function(EscalaPregadoresRecordBuilder) updates]) =
      _$EscalaPregadoresRecord;

  static EscalaPregadoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEscalaPregadoresRecordData({
  String nome,
  DateTime data,
  String img,
  bool status,
}) =>
    serializers.toFirestore(
        EscalaPregadoresRecord.serializer,
        EscalaPregadoresRecord((e) => e
          ..nome = nome
          ..data = data
          ..img = img
          ..status = status));
